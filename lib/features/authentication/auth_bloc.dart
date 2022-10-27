import 'dart:async';

import 'package:asmanshop/data/model/user.dart';
import 'package:asmanshop/data/repository/auth_repository.dart';
import 'package:asmanshop/data/repository/user_repository.dart';
import 'package:asmanshop/features/authentication/auth_event.dart';
import 'package:asmanshop/features/authentication/auth_state.dart';
import 'package:asmanshop/utils/globals/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<EnumAuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    late final AuthenticationState state;
    switch (event.status) {
      case EnumAuthenticationStatus.unauthenticated:
        state = const AuthenticationState.unauthenticated();
        break;
      case EnumAuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        state = user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated();
        break;
      case EnumAuthenticationStatus.unknown:
        state = const AuthenticationState.unknown();
    }
    emit(state);
    notifyListeners();
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser(email: '', password: '');
      return user;
    } catch (_) {
      return null;
    }
  }
}
