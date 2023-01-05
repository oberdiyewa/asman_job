// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong2/latlong.dart';

// const Epsg3857 crs = Epsg3857();

// Polyline polyineBuilder({required List<LatLng> points, required Color color}) {
//   return Polyline(points: points, color: color, strokeWidth: 5);
// }

// typedef MapMoveDelegate = void Function(
//   LatLng center,
//   double zoom, {
//   String? id,
// });

// class CachedTileProvider extends TileProvider {
//   CachedTileProvider();
//   @override
//   ImageProvider<Object> getImage(Coords<num> coords, TileLayerOptions options) {
//     return CachedNetworkImageProvider(getTileUrl(coords, options));
//   }
// }

// num calculateRealRadius({
//   required BuildContext context,
//   required double radius,
//   required LatLng point,
// }) {
//   final map = MapState.maybeOf(context);
//   assert(map != null, "Make sure map isn't null");
//   var pos = map!.project(point);
//   pos = pos.multiplyBy(map.getZoomScale(map.zoom, map.zoom)) -
//       map.getPixelOrigin();
//   final r = const Distance().offset(point, radius, 180);
//   var rpos = map.project(r);
//   rpos = rpos.multiplyBy(map.getZoomScale(map.zoom, map.zoom)) -
//       map.getPixelOrigin();
//   return rpos.y - pos.y;
// }

// class MapService {
//   MapService._(this.controller);

//   final MapController controller;

//   static MapService? _singleton;
//   static MapService get instance {
//     _ensureInitialized();
//     return _singleton!;
//   }

//   MapMoveDelegate moveDelegate = (center, zoom, {id}) {};

//   static void _ensureInitialized() {
//     _singleton ??= MapService._(MapController());
//   }

//   static void _reinitialize() {
//     _singleton = null;
//     _ensureInitialized();
//   }
// }
