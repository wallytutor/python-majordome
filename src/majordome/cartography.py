# -*- coding: utf-8 -*-
from pathlib import Path
from gpxpy.gpx import (
    GPX,
    GPXRoute,
    GPXRoutePoint,
    GPXTrack,
    GPXTrackPoint,
    GPXTrackSegment,
    GPXWaypoint,
)
import gpxpy


class GpxFile:
    """ Wrapper around gpxpy.gpx.GPX for easier loading and dumping. """
    __slots__ = (
        "name",
        "description",
        "author_name",
        "author_email"
        "waypoints",
        "routes",
        "tracks"
    )

    def __init__(self, name: str = "", description: str = "",
                 author_name: str = "", author_email: str = "",
                 waypoints: list[GPXWaypoint] = [],
                 routes: list[GPXRoute] = [],
                 tracks: list[GPXTrack] = []) -> None:
        self.name         = name
        self.description  = description
        self.author_name  = author_name
        self.author_email = author_email
        self.waypoints    = waypoints
        self.routes       = routes
        self.tracks       = tracks

    @staticmethod
    def load(fname: str | Path) -> None:
        with open(fname, encoding="utf-8") as fp:
            return gpxpy.parse(fp)

    @staticmethod
    def dump(gpx: gpxpy.gpx.GPX, fname: str | Path) -> None:
        with open(fname, "w", encoding="utf-8") as fp:
            fp.write(gpx.to_xml())


class GpxManager(GpxFile):
    def __init__(self, fname: str | Path) -> None:
        gpx = GpxFile.load(fname)

        super().__init__(gpx.name, gpx.description, gpx.author_name,
                         gpx.author_email, gpx.waypoints, gpx.routes,
                         gpx.tracks)

    def _fill_attrs(self,
            p: GPXWaypoint | GPXRoutePoint | GPXTrackPoint,
            optional: bool
        ) -> GPXWaypoint | GPXRoutePoint | GPXTrackPoint:
        """ Extract attributes from a GPX point and make a dictionary. """
        attributtes = {"latitude":  p.latitude,
                       "longitude": p.longitude,
                       "elevation": p.elevation}

        if optional:
            attributtes["time"] = p.time
            attributtes["name"] = p.name

        if isinstance(p, GPXRoutePoint):
            return GPXRoutePoint(**attributtes)

        if isinstance(p, GPXTrackPoint):
            return GPXTrackPoint(**attributtes)

        if isinstance(p, GPXWaypoint):
            attributtes["description"] = p.description
            return GPXWaypoint(**attributtes)

        raise TypeError("Unsupported point type")

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

    def _segment_points(self,
            seg: GPXTrackSegment,
            optional: bool
        ) -> list[GPXTrackPoint]:
        """ Extract points from a track segment and make a list. """
        return [self._fill_attrs(p, optional) for p in seg.points]

    def tracks_to_gpx(self, other: GPX,
                      single_segment: bool = True,
                      optional: bool = False) -> None:
        """ Copy own tracks provided instance of gpxpy.gpx.GPX. """
        other.tracks.clear()

        # ---
        # XXX: I prefer duplicate code than complicated branching!
        # ---

        for t in self.tracks:
            new_t = GPXTrack()

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
        ) -> GPX:
        """ Create a new GPX instance with own data and provided options.

        Note: when preparing traces for Garmin devices, remove optional
        attributes (time and name) to avoid Garmin's validation errors.

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
            GpxFile.dump(clean, dump)

        return clean
