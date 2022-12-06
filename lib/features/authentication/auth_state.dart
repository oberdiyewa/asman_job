import 'package:asman_work/data/model/user.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = EnumAuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: EnumAuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: EnumAuthenticationStatus.unauthenticated);

  final EnumAuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
