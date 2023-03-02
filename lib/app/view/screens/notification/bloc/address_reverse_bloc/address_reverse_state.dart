part of 'address_reverse_bloc.dart';

abstract class AddressReverseState extends Equatable {
  const AddressReverseState();

  @override
  List<Object> get props => [];
}

class AddressReverseInitial extends AddressReverseState {}

class AddressReverseLoading extends AddressReverseState {}

class AddressReverseLoaded extends AddressReverseState {
  const AddressReverseLoaded(this.address);
  final ServiceAddress address;

  @override
  List<Object> get props => [address];
}

class AddressReverseFailure extends AddressReverseState {
  const AddressReverseFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
