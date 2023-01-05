import 'dart:async';

import 'package:asman_work/app/view/home/bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(41.898372, 57.751453),
    zoom: 8,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
      builder: (context, state) {
        if (state is PublicVacancyLoaded) {
          final vacancies = state.vacancies;

          return GoogleMap(
            markers: Set.of(makeMarkers(vacancies)),
            minMaxZoomPreference: const MinMaxZoomPreference(3, 18),
            onTap: _onTap,
            initialCameraPosition: _kInitialPosition,
            onMapCreated: _controller.complete,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  List<Marker> makeMarkers(List<Vacancy> vacancies) {
    var _list = <Marker>[];
    for (final el in vacancies) {
      _list.add(
        Marker(
          markerId: MarkerId(
            el.id.toString(),
          ),
          position: el.point,
          infoWindow: InfoWindow(
            title: el.title,
            snippet: el.employerTitle,
          ),
        ),
      );
    }
    return _list;
  }

  void _onTap(LatLng argument) {
    print('-------------$argument');
  }
}
