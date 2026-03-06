# -*- coding: utf-8 -*-
from dataclasses import dataclass
from branca.colormap import LinearColormap
from folium import Map, ColorLine
from folium.plugins import MarkerCluster
from .gpx import GpxManager


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
