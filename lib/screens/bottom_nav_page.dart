import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/screens/home_screen.dart';
import 'package:gopher/screens/jobs_screen.dart';
import 'package:gopher/screens/service_screen.dart';
import 'package:provider/provider.dart';

import '../utils/color_constant.dart';
import '../view_models/bottom_nav_view_model.dart';
import '../widgets/bottom_nav_bar.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  static const List<Widget> _children = [
    HomeScreen(),
    JobsScreen(),
    ServiceScreen(),
    Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _children[provider.currentPage],
          extendBody: true,
          floatingActionButton: Container(
            height: 52.h,
            width: 52.h,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5.r),
            ),
            child: Icon(Icons.add, size: 24.sp, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
