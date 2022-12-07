import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/data/repository/user_repository.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:asman_work/utils/settings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:asman_work/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomNavigationProvider(EnumScreenName.home),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteConfigs.router(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

// class AppView extends StatelessWidget {
//   const AppView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( 
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//         colorScheme: ColorScheme.fromSwatch(
//           accentColor: const Color(0xFF13B9FF),
//         ),
//       ),
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//       ],
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: const CounterPage(),
//     );
//   }
// }
