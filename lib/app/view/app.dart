import 'package:asman_work/app/view/home/bloc/entity_detail_bloc/entity_detail_bloc.dart';
import 'package:asman_work/app/view/home/bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/main/main_screen.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/data/repository/user_repository.dart';
import 'package:asman_work/data/repository/vacancy_repository.dart';
import 'package:asman_work/l10n/l10n.dart';
import 'package:asman_work/utils/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          create: (_) => BottomNavigationProvider(),
        ),
        BlocProvider(
          create: (_) => EntityDetailBloc(VacancyRepository()),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => PublicVacancyBloc(
            VacancyRepository(),
          )..add(PublicVacancyFetchEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => TabControllerCubit(),
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          home: const MainScreen(),
          theme: CustomTheme.theme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
