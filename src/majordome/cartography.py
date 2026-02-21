# -*- coding: utf-8 -*-
from pathlib import Path
import gpxpy


class GpxMetadata:
    __slots__ = ("name", "description", "author_name", "author_email")

    def __init__(self, name: str = "", description: str = "",
                 author_name: str = "", author_email: str = "") -> None:
        self.name = name
        self.description = description
        self.author_name = author_name
        self.author_email = author_email


class GpxFile(GpxMetadata):
    __slots__ = ("waypoints", "routes", "tracks")

    def __init__(self, name: str = "", description: str = "",
                 author_name: str = "", author_email: str = "",
                 waypoints: list[gpxpy.gpx.GPXWaypoint] = [],
                 routes: list[gpxpy.gpx.GPXRoute] = [],
                 tracks: list[gpxpy.gpx.GPXTrack] = []) -> None:
        super().__init__(name, description, author_name, author_email)
        self.waypoints = waypoints
        self.routes = routes
        self.tracks = tracks


class GpxManager(GpxFile):
    def __init__(self, fname: str | Path) -> None:
        gpx = GpxManager.load(fname)

        super().__init__(gpx.name, gpx.description, gpx.author_name,
                         gpx.author_email, gpx.waypoints, gpx.routes,
                         gpx.tracks)

    @staticmethod
    def load(fname: str | Path) -> None:
        with open(fname, encoding="utf-8") as fp:
            return gpxpy.parse(fp)

    @staticmethod
    def dump(gpx: gpxpy.gpx.GPX, fname: str | Path) -> None:
        with open(fname, "w", encoding="utf-8") as fp:
            fp.write(gpx.to_xml())

    def metadata_to_gpx(self, other: gpxpy.gpx.GPX) -> None:
        other.name = self.name
        other.description = self.description
        other.author_name = self.author_name
        other.author_email = self.author_email

    def waypoints_to_gpx(self, other: gpxpy.gpx.GPX) -> None:
        other.waypoints.clear()

        for w in self.waypoints:
            other.waypoints.append(
                gpxpy.gpx.GPXWaypoint(
                    latitude    = w.latitude,
                    longitude   = w.longitude,
                    elevation   = w.elevation,
                    time        = w.time,
                    name        = w.name,
                    description = w.description,
                )
            )

    def routes_to_gpx(self, other: gpxpy.gpx.GPX) -> None:
        other.routes.clear()

        for r in gpx.routes:
            new_r = gpxpy.gpx.GPXRoute(
                name        = r.name,
                description = r.description
            )

            for p in r.points:
                new_r.points.append(
                    gpxpy.gpx.GPXRoutePoint(
                        latitude  = p.latitude,
                        longitude = p.longitude,
                        elevation = p.elevation,
                        time      = p.time,
                        name      = p.name,
                    )
                )

            other.routes.append(new_r)

    def tracks_to_gpx(self, other: gpxpy.gpx.GPX,
                      single_segment: bool = True) -> None:
        other.tracks.clear()


        for t in gpx.tracks:
            new_t = gpxpy.gpx.GPXTrack(
                # name        = t.name,
                # description = t.description
            )

            new_s = gpxpy.gpx.GPXTrackSegment()

            for seg in t.segments:
                if not single_segment:
                    new_s = gpxpy.gpx.GPXTrackSegment()

                for p in seg.points:
                    new_s.points.append(
                        gpxpy.gpx.GPXTrackPoint(
                            latitude  = p.latitude,
                            longitude = p.longitude,
                            elevation = p.elevation,
                            # time      = p.time,
                            # name      = p.name,
                        )
                    )

                if not single_segment:
                    new_t.segments.append(new_s)

            if single_segment:
                new_t.segments.append(new_s)

            other.tracks.append(new_t)

    def sanitize(self, *,
            include_metadata: bool = True,
            include_waypoints: bool = False,
            include_routes: bool = False,
            include_tracks: bool = True,
            single_segment: bool = True,
            dump: str | Path = None
        ) -> gpxpy.gpx.GPX:
        clean = gpxpy.gpx.GPX()

        if include_metadata:
            self.metadata_to_gpx(clean)

        if include_waypoints:
            self.waypoints_to_gpx(clean)

        if include_routes:
            self.routes_to_gpx(clean)

        if include_tracks:
            self.tracks_to_gpx(clean, single_segment)

        if dump is not None:
            GpxManager.dump(clean, dump)

        return clean


if __name__ == "__main__":
    fname = "trace.gpx"

    gpx = GpxManager(fname)
    new_gpx = gpx.sanitize(dump="clean.gpx")
