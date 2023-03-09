import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

part 'address_reverse_event.dart';
part 'address_reverse_state.dart';

class AddressReverseBloc
    extends Bloc<AddressReverseEvent, AddressReverseState> {
  AddressReverseBloc(this._repository) : super(AddressReverseInitial()) {
    on<AddressReverseFetchEvent>(_onFetchEvent);
    on<AddressReverseInitialEvent>(_onInitialEvent);
  }
  final ServicesRepository _repository;

  void _onInitialEvent(
    AddressReverseInitialEvent event,
    Emitter<AddressReverseState> emit,
  ) {
    emit(AddressReverseInitial());
  }

  Future<void> _onFetchEvent(
    AddressReverseFetchEvent event,
    Emitter<AddressReverseState> emit,
  ) async {
    emit(AddressReverseLoading());
    try {
      final street = await _repository.searchedAddressByPoint(event.point);
      emit(AddressReverseLoaded(street));
    } catch (e) {
      emit(
        AddressReverseFailure(
          e.toString(),
        ),
      );
    }
  }
}
