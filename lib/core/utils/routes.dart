import 'package:auto_route/auto_route.dart';
import '../../view/authentication/instagram/instagram_view.dart';
import '../../view/authentication/login/login_view.dart';
import '../../view/profile/profile_view.dart';


@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, initial: true),
    AutoRoute(page: InstagramView),
    AutoRoute(page: ProfileView),
  ],
)
class $AppRouter {}