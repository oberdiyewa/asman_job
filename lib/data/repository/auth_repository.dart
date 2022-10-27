import 'dart:async';

import 'package:asmanshop/utils/globals/enums.dart';

class AuthenticationRepository {
  final _controller = StreamController<EnumAuthenticationStatus>();

  Stream<EnumAuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield EnumAuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(EnumAuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(EnumAuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
