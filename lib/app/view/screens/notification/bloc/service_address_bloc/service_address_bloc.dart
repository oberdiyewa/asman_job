import 'package:asman_work/data/model/service_adress.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_address_event.dart';
part 'service_address_state.dart';

class ServiceAddressBloc
    extends Bloc<ServiceAddressEvent, ServiceAddressState> {
  ServiceAddressBloc(this._repository) : super(ServiceAddressInitial()) {
    on<ServiceAddressFetchEvent>(_onFetchEvent);
    on<ServiceAddressClearEvent>(_onClearEvent);
    on<ServiceAddressAddEvent>(_onAddEvent);
    on<ServiceAddressUpdateEvent>(_onUpdateEvent);
  }
  final ServicesRepository _repository;

  Future<void> _onFetchEvent(
    ServiceAddressFetchEvent event,
    Emitter<ServiceAddressState> emit,
  ) async {
    try {
      emit(
        ServiceAddressLoading(),
      );
      final searchedAddressList =
          await _repository.searchedAddressList(event.street);
      emit(
        ServiceAddressLoaded(searchedAddressList),
      );
    } catch (e) {
      emit(
        ServiceAddressFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onClearEvent(
    ServiceAddressClearEvent event,
    Emitter<ServiceAddressState> emit,
  ) async {
    emit(ServiceAddressLoading());
    emit(const ServiceAddressLoaded([]));
  }

  Future<void> _onAddEvent(
    ServiceAddressAddEvent event,
    Emitter<ServiceAddressState> emit,
  ) async {
    emit(ServiceAddressLoading());
    try {
      await _repository.addAddress(event.address, event.id);
      emit(ServiceAddressAddSuccess());
      emit(const ServiceAddressLoaded([]));
    } catch (e) {
      emit(
        ServiceAddressFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onUpdateEvent(
    ServiceAddressUpdateEvent event,
    Emitter<ServiceAddressState> emit,
  ) async {
    emit(ServiceAddressLoading());
    try {
      final response = await _repository.updateAddress(
        event.address,
        id: event.id,
        addressId: event.addressId,
      );
      emit(const ServiceAddressLoaded([]));
    } catch (e) {
      emit(
        ServiceAddressFailure(
          e.toString(),
        ),
      );
    }
  }
}
