import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/utils/string_utils.dart';
import 'package:gopher/view_models/service_view_model.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceViewModel viewModel = context.watch();

    return Scaffold(
      appBar: CustomAppBar(title: 'Select Service'),
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
          for (final type in ServiceType.values)
            _buildServiceCard(context, type, viewModel),
        ],
      ),
    );
  }

  InkWell _buildServiceCard(
    BuildContext context,
    ServiceType type,
    ServiceViewModel viewModel,
  ) {
    final bool isSelected = viewModel.selectedServiceType == type;
    return InkWell(
      onTap: () {
        viewModel.setServiceType(type);
        if (type == ServiceType.gopher) {
          Navigator.pushNamed(context, selectGopherScreen);
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(type.asset, height: 138.h, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: RichText(
        text: TextSpan(
          text: 'Please select the type of service you require ',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textBlackColor),
          children: [
            TextSpan(
              text: 'Gopher',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' or ',
              style: TextStyle(fontSize: 14.sp),
            ),
            TextSpan(
              text: 'Professional',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
