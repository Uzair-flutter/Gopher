// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopher/app_init.dart';
import 'package:gopher/services/storage_service.dart';
import 'package:gopher/utills/screen_size.dart';
import 'package:gopher/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

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
