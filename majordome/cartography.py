# -*- coding: utf-8 -*-
from dataclasses import dataclass
from pathlib import Path
from typing import Self
from numpy.typing import NDArray
from branca.colormap import LinearColormap
from folium import Map, ColorLine
from folium.plugins import MarkerCluster
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


@dataclass
class Tiles:
    """ Representation of tiles for map rendering. """
    url: str
    attribution: str


def map_at_location(center: tuple, tiles: Tiles, opts: dict = {}) -> Map:
    """ Create map around given location with provided tiles. """
    base_map = Map(
        location = center,
        tiles    = tiles.url,
        attr     = tiles.attribution,
        **(opts or TRACK_DISPLAY_OPTS)
    )

    return base_map


def display_track(gpx: GpxManager, *,
                  tiles: Tiles | None = None,
                  opts: dict | None= None, **kws) -> Map:
        """ Display track on a map with provided tile set. """
        tiles = tiles or OPENTOPOMAP
        opts = opts or TRACK_DISPLAY_OPTS

        kws.setdefault("weight", 6)
        kws.setdefault("colored", False)
        kws.setdefault("colormap", None)

        if kws.get("colormap") is not None:
            kws["colored"] = True

        track_map = map_at_location(gpx.center, tiles, opts)
        track_map.fit_bounds(bounds=gpx.bounds)

        line_opts = {"positions": gpx.coordinates, "weight": kws.get("weight")}

        if kws.get("colored"):
            # TODO make possible to use with slope-based colormap
            elevation = gpx.elevation
            # elevation = gpx.slope  # FRAGILE DO NOT USE!

            if kws.get("colormap") is not None:
                colormap = kws.pop("colormap")
            else:
                colormap = LinearColormap(
                    colors = ["green", "blue", "red"],
                    vmin   = kws.get("vmin", elevation.min()),
                    vmax   = kws.get("vmax", elevation.max())
                )

            line_opts.update({"colors": elevation, "colormap": colormap})

        ColorLine(**line_opts).add_to(track_map)
        return track_map


OPENSTREETMAPFR = Tiles(
    url="https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png",
    attribution="&copy; OpenStreetMap France"
)

OPENTOPOMAP = Tiles(
    url="https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
    attribution="&copy; OpenTopoMap"
)

CYCLOSM = Tiles(
    url="https://{s}.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png",
    attribution="&copy; CyclOSM"
)

MTBMAP = Tiles(
    url="http://tile.mtbmap.cz/mtbmap_tiles/{z}/{x}/{y}.png",
    attribution="&copy; MtbMap"
)

TRACK_DISPLAY_OPTS = {
    "width": "100%",
    "height": "100%",
    "left": "0%",
    "top": "0%",
    "min_zoom": 5,
    "max_zoom": 18,
    "position": "relative",
    "crs": "EPSG3857",
    "control_scale": True,
    "prefer_canvas": False,
    "no_touch": True,
    "disable_3d": False,
    "png_enabled": True,
    "zoom_control": True
}


# TODO finish map annotations!
# class Waypoint:
#     """ Representation of a waypoint for tagging the map. """
#     def __init__(self, name, location, url) -> None:
#         self._name = name
#         self._location = location
#         self._url = url

#     def isinside(self, bounds, tol = 0.01):
#         """ Check whether waypoint belongs to rectangular region. """
#         (lat, lon) = self._location
#         [(lat_min, lon_min), (lat_max, lon_max)] = bounds

#         tests = [
#             (lat >= lat_min - tol),
#             (lat <= lat_max + tol),
#             (lon >= lon_min - tol),
#             (lon <= lon_max + tol)
#         ]

#         return all(tests)

#     @property
#     def name(self):
#         """ Provides access to attribute. """
#         return self._name

#     @property
#     def location(self):
#         """ Provides access to attribute. """
#         return self._location

#     @property
#     def url(self):
#         """ Provides access to attribute. """
#         return self._url

#     @property
#     def link(self):
#         """ Provides access to attribute. """
#         return f"<a href=\"{self._url}\" target=\"_blank\">{self._name}</a>"

#     @classmethod
#     def get_coordinates(cls, waypoints):
#         """ Extract coordinates from a list of waypoints. """
#         def extractor(w):
#             # Do not insist in creating new objects here:
#             return w["location"] if isinstance(w, dict) else w.location

#         return [extractor(w) for w in waypoints]

# if waypoints := self._gpc.get("waypoints", None):
#     self.add_waypoints(bounds, waypoints)

# self.add_trace(coordinates, elevation)
# self.add_gridlines(bounds, grid_interval)
# self._map.save(trace_html)

# @staticmethod
# def feed_waypoint(cluster, point, bounds):
#     """ Feed a single waypoint to map. """
#     wp = Waypoint(**point)

#     if not wp.isinside(bounds):
#         return

#     popup = folium.Popup(wp.link, min_width=100, max_width=300)
#     folium.Marker(wp.location, popup=popup).add_to(cluster)

# def add_waypoints(self, bounds, waypoints):
#     """ Add relevant waypoints to map. """
#     cluster = MarkerCluster().add_to(self._map)

#     for point in waypoints:
#         self.feed_waypoint(cluster, point, bounds)

# def add_gridlines(self, bounds, interval):
#     """ Add gridlines to map with given parameters. """
#     [(lat_min, lon_min), (lat_max, lon_max)] = bounds

#     lat_lines = np.arange(
#         lat_min - interval,
#         lat_max + interval,
#         interval
#     )

#     lon_lines = np.arange(
#         lon_min - interval,
#         lon_max + interval,
#         interval
#     )

#     for lat in lat_lines:
#         folium.PolyLine(
#             locations  = [[lat, -180], [lat, 180]],
#             color      = "black",
#             weight     = 0.3,
#             dash_array = "1"
#         ).add_to(self._map)

#     for lon in lon_lines:
#         folium.PolyLine(
#             locations  = [[-90, lon], [90, lon]],
#             color      = "black",
#             weight     = 0.3,
#             dash_array = "1"
#         ).add_to(self._map)

# def dump_png(self, saveas, time_out=5.0):
#     """ Dump map as a PNG file using Selenium. """
#     img_data = self._map._to_png(time_out)
#     img_data = io.BytesIO(img_data)
#     img = Image.open(img_data)
#     img.save(saveas)
