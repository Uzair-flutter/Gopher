import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app_init.dart';
import 'services/storage_service.dart';
import 'utils/screen_size.dart';
import 'view_models/bottom_nav_view_model.dart';
import 'view_models/service_view_model.dart';
import 'view_models/theme_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize StorageService before creating providers
  await StorageService().init();
  await GoogleFonts.pendingFonts([GoogleFonts.inter()]);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => ServiceViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: getDesignSize(),
        minTextAdapt: true,
        splitScreenMode: true,
        child: AppInit(),
      ),
    ),
  );
}
