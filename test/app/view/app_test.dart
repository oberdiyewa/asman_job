// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:asman_work/app/view/app.dart';
import 'package:asman_work/data/repository/auth_repository.dart';
import 'package:asman_work/data/repository/user_repository.dart';
import 'package:asman_work/features/counter/view/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          authenticationRepository: AuthenticationRepository(),
          userRepository: UserRepository(),
        ),
      );
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
