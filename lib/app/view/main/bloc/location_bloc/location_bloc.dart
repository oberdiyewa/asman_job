import 'dart:async';

import 'package:asman_work/app/services/location_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this.locationService) : super(LocationInitial()) {
    on<LocationStarted>(_onStarted);
    on<LocationChanged>(_onChanged);
  }
  StreamSubscription<Position>? _locationSubscription;

  final LocationRepository locationService;

  Future<void> _onStarted(
    LocationStarted event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoadInProceess());
    final currentLocation = await locationService.myLocation;
    print('my current location $currentLocation');
    await _locationSubscription?.cancel();
    _locationSubscription = Geolocator.getPositionStream().listen(
      (Position position) => add(
        LocationChanged(position: position),
      ),
    );
  }

  void _onChanged(
    LocationChanged event,
    Emitter<LocationState> emit,
  ) {
    emit(LocationLoadSuccess(position: event.position));
  }

  @override
  Future<void> close() async {
    await _locationSubscription?.cancel();
    return super.close();
  }
}
