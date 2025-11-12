import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/profile_view_model.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/bottom_sheets/image_selection_bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/phone_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  Future<void> _onChangeProfile(BuildContext context) async {
    final path = await ImageSelectionBottomSheet.show(context: context);
    if (path != null) {
      if (context.mounted) {
        context.read<ProfileViewModel>().setProfilePath(path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Consumer<ProfileViewModel>(
                        builder: (_, viewModel, child) {
                          if (viewModel.profilePath != null) {
                            return Image.file(
                              File(viewModel.profilePath!),
                              fit: BoxFit.cover,
                              height: 75.w,
                              width: 75.w,
                            );
                          }
                          return Image.asset(
                            DummyAssets.person,
                            fit: BoxFit.cover,
                            height: 75.w,
                            width: 75.w,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    right: 130.w,
                    child: Container(
                      height: 35.w,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => _onChangeProfile(context),
                        icon: Icon(
                          Iconsax.camera,
                          color: Colors.white,
                          size: 21.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(hintText: "Alexander Detorit"),
              ),
              SizedBox(height: 10.h),
              Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "detroit.alex@sample.com",
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Date Of Birth",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(decoration: InputDecoration(hintText: "12 March 1997")),
              SizedBox(height: 20.h),
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              PhoneWidget(controller: TextEditingController(), filled: true),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(onPressed: () {}, child: Text("Update Changes")),
      ),
    );
  }
}
