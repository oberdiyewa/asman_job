import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/data/model/public_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class ProfileLayer extends StatefulWidget {
  const ProfileLayer({
    required this.mapMoveDelegate,
    super.key,
  });

  final MapMoveDelegate mapMoveDelegate;

  @override
  State<ProfileLayer> createState() => _ProfileLayerState();
}

class _ProfileLayerState extends State<ProfileLayer> {
  // late PopupController stopsPopupController;
  late MapService mapService;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicProfileBloc, PublicProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PublicProfileLoaded) {
          final profiles = state.profiles;
          final markers = profileMarkers(profiles);
          return MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              centerMarkerOnClick: false,
              rotate: true,
              // disableClusteringAtZoom: 14,
              markers: markers,
              builder: (context, markers) {
                return Transform.rotate(
                  angle: -FlutterMapState.maybeOf(context)!.rotationRad,
                  child: Image.asset(Assets.workerLocation),
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

  List<Marker> profileMarkers(List<PublicEntity> profiles) {
    final markers = profiles
        .map(
          (profile) => Marker(
            key: Key('${profile.id}'),
            rotate: true,
            rotateAlignment: Alignment.center,
            height: 40,
            width: 40,
            point: profile.point,
            builder: (_) => GestureDetector(
              onTap: () {
                MapService.instance
                    .onMarkerTapped(context, entity: profile, isVacancy: false);
              },
              child: Image.asset(Assets.workerLocation),
            ),
          ),
        )
        .toList();
    return markers;
  }
}
