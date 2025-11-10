// app_init.dart
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/screen_size.dart';
import 'package:gopher/utils/theme.dart';
import 'package:gopher/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

import 'route_generator.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    return ScreenUtilInit(
      designSize: getDesignSize(context: context),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gopher',
          initialRoute: splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
        );
      },
    );
  }
}
