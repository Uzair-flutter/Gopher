import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';

class RideDetailScreen extends StatelessWidget {
  const RideDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [SizedBox(height: 63.h),
          buildRiderInfo(),
          Container(
            padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Row(children: [
        Container()
      ],),
          )
        ]),
      ),
    );
  }

   buildRiderInfo() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Center(
                  child: Image.asset(
                    DummyAssets.person,
                    fit: BoxFit.cover,
                    height: 42.w,
                    width: 42.w,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Christopher Smith",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        PngAssets.tickBadge,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "4.4",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(
                SvgAssets.messageBlue,
                height: 38.h,
                width: 38.w,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Divider(color: Colors.grey[200], height: 3.h),
          SizedBox(height: 20.h),
          Text(
            "Rider is on his way and will be there shortly. Please be ready for the service!",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
