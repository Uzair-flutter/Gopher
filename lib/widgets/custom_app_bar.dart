import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonVisible;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButtonVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,

      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textBlackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      leadingWidth: isBackButtonVisible ? 60.w : 0,
      leading: isBackButtonVisible
          ? Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Center(
                child: SizedBox(
                  width: 72.w,
                  child: Card(
                    color: AppColors.appbarBackColor,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(
                          Iconsax.arrow_left,
                          color: Color(0xff292D32),
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
