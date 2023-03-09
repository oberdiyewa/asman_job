import 'package:asman_work/app/view/screens/details_screen.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

typedef MapMoveDelegate = void Function(
  LatLng center,
  double zoom, {
  String? id,
});

class CachedTileProvider extends TileProvider {
  CachedTileProvider();
  @override
  ImageProvider getImage(Coords<num> coords, TileLayer options) {
    return CachedNetworkImageProvider(
      getTileUrl(coords, options),
    );
  }
}

num calculateRealRadius({
  required BuildContext context,
  required double radius,
  required LatLng point,
}) {
  final map = FlutterMapState.maybeOf(context);
  assert(map != null, '');
  var pos = map!.project(point);
  pos = pos.multiplyBy(map.getZoomScale(map.zoom, map.zoom)) - map.pixelOrigin;
  final r = const Distance().offset(point, radius, 180);
  var rpos = map.project(r);
  rpos =
      rpos.multiplyBy(map.getZoomScale(map.zoom, map.zoom)) - map.pixelOrigin;
  return rpos.y - pos.y;
}

class MapService {
  MapService._(this.mapController);

  static MapService get instance {
    _ensureInitialized();
    return _singleton!;
  }

  static MapService? _singleton;

  final MapController mapController;

  // ignore: prefer_final_fields
  MapMoveDelegate? moveDelegate = (_, __, {id}) {};

  ValueNotifier<LatLng?> selectedPoint = ValueNotifier(null);

  void onMarkerTapped(
    BuildContext ctx, {
    required PublicEntity entity,
    required bool isVacancy,
  }) {
    Navigator.push(
      ctx,
      MaterialPageRoute<dynamic>(
        builder: (_) => DetailsScreen(
          publicEntity: entity,
          isVacancy: isVacancy,
        ),
      ),
    );
    // if (fromSearch) {
    //   ctx.read<BottomNavigationProvider>().changeScreen(EnumScreenName.home);
    // }
    // ctx.read<TabControllerCubit>().changeTab(
    //       EnumDraggableSheetState.detail,
    //       id: publicEntity.id,
    //       isVacancy: isVacancy,
    //     );
    if (isVacancy) {
      ctx
          .read<PublicVacancyDetailBloc>()
          .add(PublicVacancyDetailFetchEvent(entity.id));
    } else {
      ctx
          .read<PublicProfileDetailBloc>()
          .add(PublicProfileDetailFetchEvent(entity.id));
    }
  }

  static void _ensureInitialized() {
    _singleton ??= MapService._(MapController());
  }

  static void reinitialize() {
    // _singleton = null;
    _ensureInitialized();
  }
}
