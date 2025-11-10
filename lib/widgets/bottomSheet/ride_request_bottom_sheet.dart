import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';

void showRidesRequestSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.w,
              right: 20.w,
              top: 10.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      height: 5.h,
                      width: 48.w,
                      margin: EdgeInsets.only(bottom: 30.h),
                      decoration: BoxDecoration(
                        color: Color(0xffCDCFD0),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),

                  // Review text
                  Center(
                    child: Text(
                      "Current Offers",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),
                  Divider(color: Colors.grey[200]!),
                  SizedBox(height: 24.h),
                  Container(
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
                            Column(children: [
                              Row(
                                children: [
                                  Text("Christopher Smith",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textBlackColor)),
                                          SizedBox(width: 4.w),
                                          
                                ],
                              ),
                            ],)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
