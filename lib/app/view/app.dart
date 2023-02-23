import 'package:asman_work/app/services/location_service.dart';
import 'package:asman_work/app/services/shared_prefs_manager.dart';
import 'package:asman_work/app/view/main/bloc/locale_cubit/locale_cubit.dart';
import 'package:asman_work/app/view/main/bloc/location_bloc/location_bloc.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/app/view/main/main_screen.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/search/bloc/bloc.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/l10n/l10n.dart';
import 'package:asman_work/utils/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isUserRegistred = TokenRepository().getAccessToken.isNotEmpty;
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
        BlocProvider<LocaleCubit>(
          lazy: false,
          create: (context) => LocaleCubit(
            SharedPrefsManager.instance!.getLangCode(),
          ),
        ),
        BlocProvider<LocationBloc>(
          lazy: false,
          create: (context) =>
              LocationBloc(LocationRepository())..add(LocationStarted()),
        ),
        BlocProvider<PublicProfileDetailBloc>(
          create: (context) => PublicProfileDetailBloc(
            PublicProfileRepository(),
          ),
        ),
        BlocProvider<PublicVacancyDetailBloc>(
          create: (context) => PublicVacancyDetailBloc(
            PublicVacancyRepository(),
          ),
        ),
        BlocProvider<PublicProfileBloc>(
          lazy: false,
          create: (context) => PublicProfileBloc(
            PublicProfileRepository(),
          )..add(
              const PublicProfileFetchEvent(),
            ),
        ),
        BlocProvider<PublicVacancyBloc>(
          lazy: false,
          create: (context) => PublicVacancyBloc(
            PublicVacancyRepository(),
          )..add(
              const PublicVacancyFetchEvent(),
            ),
        ),
        BlocProvider<SearchProfileBloc>(
          create: (context) => SearchProfileBloc(
            PublicProfileRepository(),
          )..add(
              const SearchProfileFetchEvent(),
            ),
        ),
        BlocProvider<SearchVacancyBloc>(
          create: (context) => SearchVacancyBloc(
            PublicVacancyRepository(),
          )..add(
              const SearchVacancyFetchEvent(),
            ),
        ),
        BlocProvider<ServiceAddressBloc>(
          create: (context) => ServiceAddressBloc(
            ServicesRepository(),
          ),
        ),
        BlocProvider<TabControllerCubit>(
          lazy: false,
          create: (_) =>
              TabControllerCubit()..changeTab(EnumDraggableSheetState.none),
        ),
        BlocProvider<UserCatalogueBloc>(
          lazy: false,
          create: (context) => UserCatalogueBloc(
            UserCatalogueRepository(),
          )..add(
              UserCatalogueFetchEvent(),
            ),
        ),
        BlocProvider<UserBloc>(
          lazy: false,
          create: (context) => UserBloc(
            UserRepository(),
          )..add(
              UserFetchEvent(isUserRegistred: isUserRegistred),
            ),
        ),
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
          key: const Key('asm_shop'),
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
