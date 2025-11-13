import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/widgets/bottomSheet/cancel_booking.dart';
import 'package:gopher/widgets/bottom_shadow_bar.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking Detail"),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(height: 24.h),
                Column(
                  children: [
                    SizedBox(height: 66.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 26.h,
                        horizontal: 16.w,
                      ),
                      //   height: 556.h,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            profilebar(),
                            SizedBox(height: 20.h),
                            Divider(color: Colors.grey[200]!, height: 0),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textGreyColor,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13.w,
                                    vertical: 9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAECCE),

                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    "Upcoming",
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff8C6227),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textGreyColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "14 Oct 2025",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textGreyColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "14 Oct 2025 |11:00 AM",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Text(
                                  "Worker",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textGreyColor,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        DummyAssets.person,
                                        height: 22.h,
                                        width: 22.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      "Jan McCafferty",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textBlackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Divider(color: Colors.grey[200]!, height: 0),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$74",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Image.asset(
                              DummyAssets.map,
                              // height: 208.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 24,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kSecondaryColor,
                    ),
                    child: Icon(Iconsax.clock, size: 24.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomShadowBar(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withValues(alpha: 0.2),
                elevation: 0,
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                showCancelBookingSheet(context);
              },
              child: Text('Cancel Booking'),
            ),
          ),
        ),
      ),
    );
  }
}

profilebar() {
  return Container(
    height: 81.h,

    child: Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(
            DummyAssets.job,
            fit: BoxFit.fill,
            height: 81.h,
            width: 81.w,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Cleaner",
              style: TextStyle(
                height: 0,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Service Provider",
              style: TextStyle(
                height: 0,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGreyColor,
              ),
            ),
            Spacer(),
            Text(
              "\$25",
              style: TextStyle(
                height: 0,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlackColor,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(Iconsax.star1, size: 18.sp, color: Color(0xffFFC627)),
                SizedBox(width: 3.w),
                Text(
                  "4.4",
                  style: TextStyle(
                    height: 0,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlackColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Iconsax.location,
                  size: 18.sp,
                  color: AppColors.kPrimaryColor,
                ),
                SizedBox(width: 3.w),
                Text(
                  "3.2 mile",
                  style: TextStyle(
                    height: 0,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
