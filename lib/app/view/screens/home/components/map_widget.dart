import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/location_bloc/location_bloc.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/home/components/layers/profile_layer.dart';
import 'package:asman_work/app/view/screens/home/components/layers/select_address_layer.dart';
import 'package:asman_work/app/view/screens/home/components/layers/vacancy_layer.dart';
import 'package:asman_work/app/view/screens/notification/bloc/address_reverse_bloc/address_reverse_bloc.dart';
import 'package:asman_work/utils/globals/consts.dart';
import 'package:asman_work/utils/settings/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    required this.forChoosingAddress,
    super.key,
  });
  final bool forChoosingAddress;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>
    with SingleTickerProviderStateMixin {
  Position? currentPositionOfTheUser;

  LatLng get currentLatLngCenter {
    if (currentPositionOfTheUser?.latitude == null ||
        currentPositionOfTheUser?.longitude == null) {
      return AppConstants.ashgabatPosition;
    } else {
      return currentPositionOfTheUser!.toLatLng();
    }
  }

  bool isPointerDown = false;

  @override
  void initState() {
    initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MapService.instance.hashCode);
    return Stack(
      children: [
        FlutterMap(
          mapController: MapService.instance.mapController,
          options: MapOptions(
            center: currentLatLngCenter,
            zoom: 8,
            maxZoom: 18,
            minZoom: 2,
            onPointerDown: (event, point) {
              if (widget.forChoosingAddress) {
                setState(() {
                  isPointerDown = true;
                });
              }
            },
            onPointerUp: (event, point) {
              if (widget.forChoosingAddress) {
                setState(() {
                  isPointerDown = false;
                });
                MapService.instance.selectedPoint.value = point;
                context.read<AddressReverseBloc>().add(
                      AddressReverseFetchEvent(
                        point,
                      ),
                    );
                print(MapService.instance.selectedPoint.value);
              }
            },
            onTap: (position, latlong) {
              // print(latlong);
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'http://geo.asmantiz.com/tile/{z}/{x}/{y}.png',
              tileProvider: CachedTileProvider(),
            ),
            if (!widget.forChoosingAddress)
              BlocBuilder<TabControllerCubit, TabControllerState>(
                builder: (context, state) {
                  final tabState = state as TabControllerSelected;
                  if (tabState.draggableSheetState ==
                          EnumDraggableSheetState.none ||
                      tabState.draggableSheetState ==
                          EnumDraggableSheetState.lookingJob ||
                      (tabState.isVacancy ?? false)) {
                    return VacancyLayer(mapMoveDelegate: _animatedMapMove);
                  } else {
                    return ProfileLayer(mapMoveDelegate: _animatedMapMove);
                  }
                },
              ),
            BlocConsumer<LocationBloc, LocationState>(
              listener: (context, state) {
                if (state is LocationLoadSuccess) {
                  currentPositionOfTheUser = state.position;
                }
              },
              builder: (context, state) {
                return MarkerLayer(
                  markers: [
                    Marker(
                      rotate: true,
                      height: 40,
                      width: 40,
                      point: currentLatLngCenter,
                      builder: (context) => Image.asset(Assets.myLocation),
                    )
                  ],
                );
              },
            ),
            if (widget.forChoosingAddress)
              Align(
                child: SelectedAddressLayer(
                  isPointerDown: isPointerDown,
                ),
              )
          ],
        ),
      ],
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom, {String? id}) {
    if (mounted) {
      try {
        final latTween = Tween<double>(
          begin: MapService.instance.mapController.center.latitude,
          end: destLocation.latitude,
        );
        final lngTween = Tween<double>(
          begin: MapService.instance.mapController.center.longitude,
          end: destLocation.longitude,
        );
        final zoomTween = Tween<double>(
          begin: MapService.instance.mapController.zoom,
          end: destZoom,
        );

        final controller = AnimationController(
          duration: const Duration(milliseconds: 700),
          vsync: this,
        );
        final animation =
            CurvedAnimation(parent: controller, curve: Curves.ease);

        controller.addListener(() {
          MapService.instance.mapController.move(
            LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
            zoomTween.evaluate(animation),
          );
        });

        animation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controller.dispose();
          } else if (status == AnimationStatus.dismissed) {
            controller.dispose();
          }
        });

        controller.forward();
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  void initializeMap() {
    MapService.reinitialize();
    MapService.instance.moveDelegate = _animatedMapMove;
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
