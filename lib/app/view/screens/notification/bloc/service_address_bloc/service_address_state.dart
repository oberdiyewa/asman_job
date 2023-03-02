part of 'service_address_bloc.dart';

abstract class ServiceAddressState extends Equatable {
  const ServiceAddressState();

  @override
  List<Object?> get props => [];
}

class ServiceAddressInitial extends ServiceAddressState {}

class ServiceAddressLoading extends ServiceAddressState {}

class ServiceAddressLoaded extends ServiceAddressState {
  const ServiceAddressLoaded(this.addressList);
  final List<ServiceAddress> addressList;

  @override
  List<Object?> get props => [addressList];
}

class ServiceAddressFailure extends ServiceAddressState {
  const ServiceAddressFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
