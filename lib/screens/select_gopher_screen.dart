import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/string_utils.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../utils/color_constant.dart';
import '../utils/enums.dart';
import '../view_models/service_view_model.dart';

class SelectGopherScreen extends StatelessWidget {
  const SelectGopherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceViewModel viewModel = context.watch();
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Gopher'),
      body: _buildBody(context, viewModel),
    );
  }

  Widget _buildBody(BuildContext context, ServiceViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        spacing: 24.h,
        children: [
          _buildTitle(),
          for (final type in GopherType.values)
            _buildServiceCard(context, type, viewModel),
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

  InkWell _buildServiceCard(
    BuildContext context,
    GopherType type,
    ServiceViewModel viewModel,
  ) {
    final bool isSelected = viewModel.selectedGopherType == type;
    return InkWell(
      onTap: () {
        viewModel.setGopherType(type);
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
          border: Border.all(
            color: isSelected
                ? AppColors.kSecondaryColor
                : AppColors.textFieldFillColor,
            width: 2.r,
          ),
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
