import 'package:asmanshop/utils/globals/enums.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final EnumAuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
