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

class ServiceAddressAddEvent extends ServiceAddressEvent {
  const ServiceAddressAddEvent(this.address, this.id);

  final ServiceAddress address;
  final int id;

  @override
  List<Object?> get props => [address, id];
}

class ServiceAddressUpdateEvent extends ServiceAddressEvent {
  const ServiceAddressUpdateEvent(
    this.address, {
    required this.id,
    required this.addressId,
  });

  final ServiceAddress address;
  final int id;
  final int addressId;
  @override
  List<Object?> get props => [address, id];
}
