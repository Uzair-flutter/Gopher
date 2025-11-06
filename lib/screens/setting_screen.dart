import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utills/assets.dart';
import 'package:gopher/utills/color_constant.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0.h),
            profileBar(),
            SizedBox(height: 30.h),
            Text(
              "My Booking Service",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 14.h),
            Container(
              height: 78.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [Color(0xff053F7C), Color(0xff28609B)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bookingService(
                    title: "Upcoming",
                    icon: Iconsax.export,
                    notificationCount: "2",
                  ),
                  bookingService(
                    title: "Completed",
                    icon: Iconsax.truck,
                    notificationCount: "4",
                  ),
                  bookingService(
                    showBadge: false,
                    title: "Notifications",
                    icon: Iconsax.notification,
                    notificationCount: "0",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row profileBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Center(
            child: Image.asset(
              PngAssets.flower,
              fit: BoxFit.cover,
              height: 64.w,
              width: 64.w,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alexander Detorit",
              style: TextStyle(
                height: 0,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "detroit.alex@sample.com",
              style: TextStyle(
                height: 0,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.textFieldFillColor,
            border: Border.all(color: Colors.grey[200]!),
            //  borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Iconsax.setting_2,
            size: 18.sp,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }
}

bookingService({
  required String title,
  required IconData icon,
  required String notificationCount,
  bool showBadge = true,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          SizedBox(
            width: 96.w,
            height: 28.h,

            child: Icon(icon, size: 24.sp, color: Colors.white),
          ),
          showBadge
              ? Positioned(
                  right: 29.w,
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        notificationCount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
      SizedBox(height: 9.h),
      Text(
        title,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ],
  );
}
