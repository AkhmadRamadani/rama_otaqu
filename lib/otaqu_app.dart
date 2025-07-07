import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rama_otaqu/core/config/route/route_config.dart';
import 'package:rama_otaqu/core/themes/otaqu_light_theme.dart';

class OtaquApp extends StatelessWidget {
  OtaquApp({super.key});
  final _routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp.router(
            title: 'Otaqu',
            theme: otaquLightTheme,
            routerConfig: _routeConfig.config(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                behavior: HitTestBehavior.opaque,
                child: child,
              );
            },
          ),
    );
  }
}
