import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/color_constant.dart';

class ServiceItem {
  final String icon;
  final String label;
  bool isSelected;

  ServiceItem({
    required this.icon,
    required this.label,
    required this.isSelected,
  });
}

class ServiceItemWidget extends StatefulWidget {
  final ServiceItem service;
  final VoidCallback? onTap;

  const ServiceItemWidget({super.key, required this.service, required this.onTap});

  @override
  State<ServiceItemWidget> createState() => _ServiceItemWidgetState();
}

class _ServiceItemWidgetState extends State<ServiceItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Container
          Container(
            width: 52.w,
            height: 52.h,
            padding: EdgeInsets.all(13.w),
            decoration: BoxDecoration(
              color: widget.service.isSelected
                  ? AppColors.kPrimaryColor
                  : AppColors.widgetBackColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              widget.service.icon,
              color: widget.service.isSelected
                  ? Colors.white
                  : AppColors.kPrimaryColor,
              height: 18.w,
              width: 18.w,
            ),

            // Icon(
            //   service.icon,
            //   color: AppColors.kPrimaryColor,
            //   size: 24.sp,
            // ),
          ),
          SizedBox(height: 3.h),
          // Label
          Text(
            widget.service.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              fontSize: 12.sp,
              color: widget.service.isSelected
                  ? AppColors.kPrimaryColor
                  : AppColors.iconColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
