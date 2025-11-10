import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';

class BookingReviewScreen extends StatelessWidget {
  const BookingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Review Summary', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 104.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFFEEEFF3),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Image.asset(
                          DummyAssets.person,
                          fit: BoxFit.fill,
                          height: 71.h,
                          width: 81.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'serviceName',
                            style: TextStyle(
                              height: 0,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Image.asset(DummyAssets.servicePerson),
                              SizedBox(width: 5.w),
                              Text(
                                'providerName',
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textGreyColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "\$22",
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
                              Icon(
                                Iconsax.star1,
                                size: 18.sp,
                                color: Color(0xffFFC627),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                '4.5',
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
                                'distance',
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 13.sp,
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
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingReviewScreen()),
            );
          },
          child: Text('Confirm Payment '),
        ),
      ),
    );
  }
}
