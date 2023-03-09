import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/data/model/public_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
class VacancyLayer extends StatefulWidget {
  const VacancyLayer({
    required this.mapMoveDelegate,
    super.key,
  });

  final MapMoveDelegate mapMoveDelegate;

  @override
  State<VacancyLayer> createState() => _VacancyLayerState();
}

class _VacancyLayerState extends State<VacancyLayer> {
  // late PopupController stopsPopupController;
  late MapService mapService;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicVacancyBloc, PublicVacancyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PublicVacancyLoaded) {
          final vacancies = state.vacancies;
          final markers = vacancyMarkers(vacancies);
          return MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              onMarkerTap: (marker) {
                print('tapped marker');
                // widget.mapMoveDelegate(marker.point, 16);
              },
              centerMarkerOnClick: false,
              rotate: true,
              // disableClusteringAtZoom: 14,
              markers: markers,
              builder: (context, markers) {
                return Transform.rotate(
                  angle: -FlutterMapState.maybeOf(context)!.rotationRad,
                  child: Image.asset(Assets.vacancyLocation),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  List<Marker> vacancyMarkers(List<PublicEntity> vacancies) {
    final markers = vacancies
        .map(
          (vacancy) => Marker(
            key: Key('${vacancy.id}'),
            rotate: true,
            rotateAlignment: Alignment.center,
            height: 40,
            width: 40,
            point: vacancy.point,
            builder: (_) => GestureDetector(
              onTap: () {
                MapService.instance.onMarkerTapped(
                  context,
                  entity: vacancy,
                  isVacancy: true,
                );
              },
              child: Image.asset(Assets.vacancyLocation),
            ),
          ),
        )
        .toList();
    return markers;
  }
}
