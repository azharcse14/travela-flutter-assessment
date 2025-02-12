import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    router.push(LoginRoute(onResult: (result) async {
      if (result == true) {
          resolver.next(true);
          router.removeLast();
        }
      }
    ));
  }
}
