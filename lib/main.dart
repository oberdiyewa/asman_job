import 'package:asman_work/app/app.dart';
import 'package:asman_work/bootstrap.dart';
import 'package:asman_work/data/repository/user_repository.dart';

import 'package:asman_work/utils/settings/init_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await InitialSettings.init();
  await bootstrap(
    () => App(
      userRepository: UserRepository(),
    ),
  );
}
