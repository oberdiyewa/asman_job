part of 'address_reverse_bloc.dart';

abstract class AddressReverseEvent extends Equatable {
  const AddressReverseEvent();

  @override
  List<Object> get props => [];
}

class AddressReverseInitialEvent extends AddressReverseEvent{}
class AddressReverseFetchEvent extends AddressReverseEvent {
  const AddressReverseFetchEvent(this.point);

  final LatLng point;

  @override
  List<Object> get props => [point];
}
