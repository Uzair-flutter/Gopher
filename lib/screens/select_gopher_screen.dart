import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/string_utils.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

import '../utils/color_constant.dart';
import '../utils/enums.dart';

class SelectGopherScreen extends StatelessWidget {
  const SelectGopherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Gopher'),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        spacing: 24.h,
        children: [
          _buildTitle(),
          for (final type in GopherType.values)
            _buildServiceCard(context, type),
        ],
      ),
    );
  }

  Padding _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: RichText(
        text: TextSpan(
          text: 'Please select the type of gopher you require ',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textBlackColor),
          children: [
            TextSpan(
              text: 'Rider',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' or ',
              style: TextStyle(fontSize: 14.sp),
            ),
            TextSpan(
              text: 'Delivery',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildServiceCard(BuildContext context, GopherType type) {
    return InkWell(
      onTap: () {
        if (type == GopherType.delivery) {
          Navigator.pushNamed(context, deliveryFormScreen);
        }
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Ink(
        height: 156.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        decoration: BoxDecoration(
          color: AppColors.textFieldFillColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Text(
                  type.name.capitalize,
                  style: TextStyle(
                    fontSize: 24.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.translationValues(0, 15, 0),
              child: Image.asset(type.asset, height: 138.h, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
