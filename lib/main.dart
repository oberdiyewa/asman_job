import 'package:asmanshop/app/app.dart';
import 'package:asmanshop/bootstrap.dart';
import 'package:asmanshop/data/repository/auth_repository.dart';
import 'package:asmanshop/data/repository/user_repository.dart';
import 'package:asmanshop/utils/settings/init_settings.dart';

void main() async {
  await InitialSettings.init();
  await bootstrap(
    () => App(
      userRepository: UserRepository(),
      authenticationRepository: AuthenticationRepository(),
    ),
  );
}
