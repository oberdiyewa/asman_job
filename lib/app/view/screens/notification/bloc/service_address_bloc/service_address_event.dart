part of 'service_address_bloc.dart';

abstract class ServiceAddressEvent extends Equatable {
  const ServiceAddressEvent();

  @override
  List<Object?> get props => [];
}

class ServiceAddressFetchEvent extends ServiceAddressEvent {
  const ServiceAddressFetchEvent(this.street);
  final String street;

  @override
  List<Object?> get props => [street];
}

class ServiceAddressClearEvent extends ServiceAddressEvent {}
