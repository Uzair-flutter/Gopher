import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'route_generator.dart';
import 'utils/theme.dart';
import 'view_models/theme_view_model.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gopher',
      initialRoute: splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
