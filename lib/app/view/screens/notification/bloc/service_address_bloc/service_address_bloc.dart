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
}
