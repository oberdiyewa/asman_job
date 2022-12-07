import 'package:asman_work/components/ui/screens/error_page.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/view/home/home.dart';

class RouteConfigs {
  static GoRouter router() => GoRouter(
        routes: <GoRoute>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const Home(),
          ),
        ],
        errorBuilder: (BuildContext context, GoRouterState state) =>
            ErrorScreen(state.error!),
        /*
        redirect:
         
         (BuildContext context, GoRouterState state) {
          // if the user is not logged in, they need to login
          final isLoggedIn =
              bloc.state.status == EnumAuthenticationStatus.authenticated;
          final isLoggingIn = state.location == '/login';

          if (!isLoggedIn && !isLoggingIn) return '/login';
          if (isLoggedIn && isLoggingIn) return '/';
          // no need to redirect at all
          return null;
        },
        */
      );
}
