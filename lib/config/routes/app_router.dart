import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          page: BaseRoute.page,
          guards: [AuthGuard()],
          initial: true,
          children: [
            AutoRoute(page: ExploreRoute.page),
            AutoRoute(page: BookingRoute.page),
            AutoRoute(page: InboxRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: HostRoute.page),
          ],
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
          page: LoginRoute.page,
        ),
      ];
}
