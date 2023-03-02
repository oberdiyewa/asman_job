import 'package:asman_work/app/view/app.dart';
import 'package:asman_work/bootstrap.dart';

import 'package:asman_work/utils/settings/init_settings.dart';

void main() async {
  await InitialSettings.init();
  await bootstrap(
    () => const App(),
  );
}
