import 'package:auto_route/auto_route.dart';
import 'package:rama_otaqu/core/config/route/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View,Route')
class RouteConfig extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    CustomRoute(
      path: '/intro',
      page: IntroRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      path: '/home',
      page: HomeRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      path: '/search',
      page: SearchResultRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ];

  @override
  RouteType get defaultRouteType =>
      RouteType.custom(transitionsBuilder: TransitionsBuilders.fadeIn);
}
