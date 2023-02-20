import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(options: MapOptions());
  }
}

//  class MapWidget extends StatefulWidget {
//   const MapWidget({
//     super.key,
//   });

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {

//   static const CameraPosition _kInitialPosition = CameraPosition(
//     target: LatLng(37.953231, 58.315687),
//     zoom: 8,
//   );

//   @override
//   void initState() {
//     setCustomMapPin();
//     MapService();
//     super.initState();
//   }

//   BitmapDescriptor? vacancyMarkerIcon;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
//       builder: (context, state) {
//         if (state is PublicVacancyLoaded) {
//           final vacancies = state.vacancies;

//           return GoogleMap(
//             markers: Set.of(makeMarkers(vacancies)),
//             minMaxZoomPreference: const MinMaxZoomPreference(3, 18),
//             onTap: _onTap,
//             initialCameraPosition: _kInitialPosition,
//             onMapCreated: (controller) {
//               MapService.singleton!.mapController = controller;
//             },
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }

//   Future<void> setCustomMapPin() async {
//     vacancyMarkerIcon = BitmapDescriptor.fromBytes(
//       await getBytesFromAsset(Assets.vacancyLocation),
//     );
//   }

//   Future<Uint8List> getBytesFromAsset(String path) async {
//     final data = await rootBundle.load(path);
//     final codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: 100,);
//     final fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }

//   List<Marker> makeMarkers(List<Vacancy> vacancies) {
//     var _list = <Marker>[];
//     for (final el in vacancies) {
//       _list.add(
//         Marker(
//           markerId: MarkerId(
//             el.id.toString(),
//           ),
//           position: el.point,
//           icon: vacancyMarkerIcon != null
//               ? vacancyMarkerIcon!
//               : BitmapDescriptor.defaultMarker,
//           infoWindow: InfoWindow(
//             title: el.title,
//             snippet: el.employerTitle,
//           ),
//           // icon: vacancyMarkerIcon,
//           onTap: () {
//             context
//                 .read<TabControllerCubit>()
//                 .changeTab(EnumDraggableSheetState.detail);
//             context.read<EntityDetailBloc>().add(EntityDetailFetchEvent(el.id));
//           },
//         ),
//       );
//     }
//     return _list;
//   }

//   void _onTap(LatLng argument) {
//     debugPrint('-------------$argument');
//     MapService.singleton!.mapController!
//         .getZoomLevel()
//         .then((value) => debugPrint(value.toString()));
//   }
// }
