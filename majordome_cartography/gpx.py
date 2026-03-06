# -*- coding: utf-8 -*-
from pathlib import Path
from typing import Self
from numpy.typing import NDArray
from gpxpy.gpx import (
    GPX,
    GPXRoute,
    GPXRoutePoint,
    GPXTrack,
    GPXTrackPoint,
    GPXTrackSegment,
    GPXWaypoint,
)
from gpxpy.geo import haversine_distance
import gpxpy
import numpy as np
import pandas as pd


class GpxManager:
    __slots__ = (
        "_gpx",
        "name",
        "description",
        "author_name",
        "author_email",
        "waypoints",
        "routes",
        "tracks",

        # On-request attributes:
        "_bounds",
        "_center",
        "_tracks_df",
    )

    def __init__(self, gpx: GPX) -> None:
        self._gpx         = gpx

        self.name         = gpx.name
        self.description  = gpx.description
        self.author_name  = gpx.author_name
        self.author_email = gpx.author_email
        self.waypoints    = gpx.waypoints
        self.routes       = gpx.routes
        self.tracks       = gpx.tracks

    def _fill_attrs(self,
            p: GPXWaypoint | GPXRoutePoint | GPXTrackPoint,
            optional: bool,
            data_only: bool = False
        ) -> dict | GPXWaypoint | GPXRoutePoint | GPXTrackPoint:
        """ Extract attributes from a GPX point and make a dictionary. """
        attributtes = {"latitude":  p.latitude,
                       "longitude": p.longitude,
                       "elevation": p.elevation}

        if optional:
            attributtes["time"] = p.time
            attributtes["name"] = p.name

        if data_only:
            return attributtes

        if isinstance(p, GPXRoutePoint):
            return GPXRoutePoint(**attributtes)

        if isinstance(p, GPXTrackPoint):
            return GPXTrackPoint(**attributtes)

        if isinstance(p, GPXWaypoint):
            attributtes["description"] = p.description
            return GPXWaypoint(**attributtes)

        raise TypeError("Unsupported point type")

    def _segment_points(self,
            seg: GPXTrackSegment,
            optional: bool,
            data_only: bool = False
        ) -> list[GPXTrackPoint]:
        """ Extract points from a track segment and make a list. """
        def extractor(p):
            return self._fill_attrs(p, optional, data_only)

        return [extractor(p) for p in seg.points]

    def metadata_to_gpx(self, other: GPX) -> None:
        """ Copy own metadata provided instance of gpxpy.gpx.GPX. """
        other.name         = self.name
        other.description  = self.description
        other.author_name  = self.author_name
        other.author_email = self.author_email

    def waypoints_to_gpx(self, other: GPX, optional: bool = False) -> None:
        """ Copy own waypoints provided instance of gpxpy.gpx.GPX. """
        other.waypoints.clear()

        for w in self.waypoints:
            other.waypoints.append(self._fill_attrs(w, optional))

    def routes_to_gpx(self, other: GPX, optional: bool = False) -> None:
        """ Copy own routes provided instance of gpxpy.gpx.GPX. """
        other.routes.clear()

        for r in self.routes:
            new_r = GPXRoute()

            for p in r.points:
                new_r.points.append(self._fill_attrs(p, optional))

            other.routes.append(new_r)

    def tracks_to_gpx(self, other: GPX,
                      single_segment: bool = True,
                      optional: bool = False) -> None:
        """ Copy own tracks provided instance of gpxpy.gpx.GPX. """
        other.tracks.clear()

        for t in self.tracks:
            new_t = GPXTrack()

            # ---
            # XXX: I prefer duplicate code than complicated branching!
            # ---

            if single_segment:
                new_s = GPXTrackSegment()

                for seg in t.segments:
                    points = self._segment_points(seg, optional)
                    new_s.points.extend(points)

                new_t.segments.append(new_s)

            else:
                for seg in t.segments:
                    new_s = GPXTrackSegment()
                    new_s.points = self._segment_points(seg, optional)
                    new_t.segments.append(new_s)

            other.tracks.append(new_t)

    def sanitize(self, *,
            include_metadata: bool = True,
            include_waypoints: bool = False,
            include_routes: bool = False,
            include_tracks: bool = True,
            single_segment: bool = True,
            dump: str | Path = None,
            optional: bool = False
        ) -> Self:
        """ Create a new GPX instance with own data and provided options.

        Note: when preparing tracks for Garmin devices, keep in mind that
        their parser is picky and providing a minimalist track is preferred
        over a full-featured one. The defaults provided in this method are
        aimed at cleaning OruxMaps generated tracks. Also consider removing
        optional attributes (time and name) to avoid Garmin's validation
        errors if data was exported from elsewhere.

        Parameters
        ----------
        include_metadata : bool, optional
            Whether to include metadata (name, description, author) in the
            output GPX, by default True.
        include_waypoints : bool, optional
            Whether to include waypoints in the output GPX, by default False.
        include_routes : bool, optional
            Whether to include routes in the output GPX, by default False.
        include_tracks : bool, optional
            Whether to include tracks in the output GPX, by default True.
        single_segment : bool, optional
            Whether to merge all track segments into a single one, by default True.
        dump : str | Path, optional
            If provided, the output GPX will be dumped to the specified file, by default None.
        optional : bool, optional
            Whether to include optional attributes (time and name) in the output GPX, by default False.

        Returns
        -------
        GPX
            A new GPX instance containing the selected data.
        """
        clean = GPX()

        if include_metadata:
            self.metadata_to_gpx(clean)

        if include_waypoints:
            self.waypoints_to_gpx(clean, optional)

        if include_routes:
            self.routes_to_gpx(clean, optional)

        if include_tracks:
            self.tracks_to_gpx(clean, single_segment, optional)

        if dump is not None:
            GpxManager.dump(clean, dump)

        return GpxManager(clean)

    @staticmethod
    def load(fname: str | Path) -> GPX:
        """ Load GPX file from provided path. """
        with open(fname, encoding="utf-8") as fp:
            return gpxpy.parse(fp)

    @staticmethod
    def dump(gpx: GPX, fname: str | Path) -> None:
        """ Dump GPX file to provided path. """
        with open(fname, "w", encoding="utf-8") as fp:
            fp.write(gpx.to_xml())

    @classmethod
    def from_file(cls, fname: str | Path) -> Self:
        """ Load GPX file and return an instance of GpxManager. """
        gpx = cls.load(fname)
        return cls(gpx)

    @property
    def bounds(self) -> tuple[tuple[float, float], tuple[float, float]]:
        """ Get the bounding box of the track. """
        if not hasattr(self, "_bounds"):
            bounds = self._gpx.get_bounds()

            self._bounds = [(
                bounds.min_latitude,
                bounds.min_longitude
            ), (
                bounds.max_latitude,
                bounds.max_longitude
            )]

        return self._bounds

    @property
    def center(self) -> tuple[float, float]:
        """ Get the center of the track. """
        if not hasattr(self, "_center"):
            bounds = self.bounds

            self._center = (
                (bounds[0][0] + bounds[1][0]) / 2,
                (bounds[0][1] + bounds[1][1]) / 2
            )

        return self._center

    @property
    def coordinates(self) -> NDArray[float]:
        """ Get the track coordinates as a numpy array. """
        tab = self.tabulate_tracks(optional=False)
        return tab[["latitude", "longitude"]].to_numpy()

    @property
    def elevation(self) -> NDArray[float]:
        """ Get the track elevation as a numpy array. """
        tab = self.tabulate_tracks(optional=False)
        return tab["elevation"].to_numpy()

    @property
    def slope(self) -> NDArray[float]:
        """ Get the track slope as a numpy array """
        # FRAGILE DO NOT USE!
        slopes = []
        window = 10

        for track in self.tracks:
            for seg in track.segments:
                pts = seg.points
                for i in range(len(pts) - window):
                    p1 = pts[i]
                    p2 = pts[i + window]

                    d = haversine_distance(
                        p1.latitude, p1.longitude,
                        p2.latitude, p2.longitude
                    )
                    if p1.elevation is None or p2.elevation is None:
                        continue
                    dh = p2.elevation - p1.elevation

                    if d > 0:
                        slopes.append(100 * dh / d)

        return np.array(slopes)

    def tabulate_tracks(self, optional: bool = False) -> pd.DataFrame:
        """ Get the track points as a pandas DataFrame. """
        if not hasattr(self, "_tracks_df"):
            route_info = []

            for track in self.tracks:
                for segment in track.segments:
                    data = self._segment_points(segment, optional, True)
                    route_info.extend(data)

            self._tracks_df = pd.DataFrame(route_info)

        return self._tracks_df
