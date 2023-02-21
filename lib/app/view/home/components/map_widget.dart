import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/main/bloc/location_bloc/location_bloc.dart';
import 'package:asman_work/components/ui/markers/user_circle.dart';
import 'package:asman_work/utils/globals/consts.dart';
import 'package:asman_work/utils/settings/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Position? currentPositionOfTheUser;

  LatLng get currentLatLngCenter {
    if (currentPositionOfTheUser?.latitude == null ||
        currentPositionOfTheUser?.longitude == null) {
      return AppConstants.ashgabatPosition;
    } else {
      return currentPositionOfTheUser!.toLatLng();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapService.instance.mapController,
      options: MapOptions(
        center: currentLatLngCenter,
        maxZoom: 18,
        minZoom: 2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'http://geo.asmantiz.com/tile/{z}/{x}/{y}.png',
          tileProvider: CachedTileProvider(),
        ),
        Builder(builder: (context) {
          final currentPositionState = context.watch<LocationBloc>().state;
          if (currentPositionState is LocationLoadSuccess) {
            currentPositionOfTheUser = currentPositionState.position;
          }
          return MarkerLayer(
            markers: [
              Marker(
                point: currentLatLngCenter,
                builder: (context) => UserCircle(
                  point: currentLatLngCenter,
                  radius: 16,
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}


// import 'dart:async';
// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MapWidget extends StatefulWidget {
//   const MapWidget({
//     super.key,
//   });

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {
//   final super_app.AppMapController controller = super_app.AppMapController();
//   static const super_app.CameraPosition _kInitialPosition =
//       super_app.CameraPosition(
//     target: super_app.LatLng(37.953231, 58.315687),
//     zoom: 8,
//   );

//   @override
//   void initState() {
//     setCustomMapPin();
//     MapService();
//     super.initState();
//   }

//   super_app.BitmapDescriptor? vacancyMarkerIcon;

//   @override
//   Widget build(BuildContext context) {
//     return super_app.AdaptixInitializer(
//       configs: const super_app.AdaptixConfigs.canonical(),
//       builder: (context) => BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
//         builder: (context, state) {
//           if (state is PublicVacancyLoaded) {
//             final vacancies = state.vacancies;

//             return const super_app.AppMap(
//                 initialCameraPosition: _kInitialPosition,
//                 // controller: controller,
//                 isFocusable: true,
//                 isAbsorbingPointer: true,
//                 renderers: []);
//             //  super_app.GoogleMap(
//             //   markers: Set.of(makeMarkers(vacancies)),
//             //   minMaxZoomPreference: const super_app.MinMaxZoomPreference(3, 18),
//             //   onTap: _onTap,
//             //   initialCameraPosition: _kInitialPosition,
//             //   onMapCreated: (controller) {
//             //     MapService.singleton!.mapController = controller;
//             //   },
//             // );
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }

//   Future<void> setCustomMapPin() async {
//     vacancyMarkerIcon = super_app.BitmapDescriptor.fromBytes(
//       await getBytesFromAsset(Assets.vacancyLocation),
//     );
//   }

//   Future<Uint8List> getBytesFromAsset(String path) async {
//     final data = await rootBundle.load(path);
//     final codec = await ui.instantiateImageCodec(
//       data.buffer.asUint8List(),
//       targetWidth: 100,
//     );
//     final fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }

//   List<super_app.Marker> makeMarkers(List<PublicEntity> vacancies) {
//     var _list = <super_app.Marker>[];
//     for (final el in vacancies) {
//       _list.add(
//         super_app.Marker(
//           markerId: super_app.MarkerId(
//             el.id.toString(),
//           ),
//           position: el.point,
//           icon: vacancyMarkerIcon != null
//               ? vacancyMarkerIcon!
//               : super_app.BitmapDescriptor.defaultMarker,
//           infoWindow: super_app.InfoWindow(
//             title: el.title,
//             snippet: el.employerTitle,
//           ),
//           // icon: vacancyMarkerIcon,
//           onTap: () {
//             context
//                 .read<TabControllerCubit>()
//                 .changeTab(EnumDraggableSheetState.detail);
//             context
//                 .read<PublicVacancyDetailBloc>()
//                 .add(PublicVacancyDetailFetchEvent(el.id));
//           },
//         ),
//       );
//     }
//     return _list;
//   }

//   void _onTap(super_app.LatLng argument) {
//     debugPrint('-------------$argument');
//     MapService.singleton!.mapController!
//         .getZoomLevel()
//         .then((value) => debugPrint(value.toString()));
//   }
// }
