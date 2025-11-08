import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/screens/create_new_account_screen.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.center,
                "Log in to access your account and explore our services",
                style: TextStyle(
                  height: 0,
                  fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 32.h),
              Text(
                "Email",

                style: TextStyle(
                  height: 0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(hintText: "Enter your email"),
              ),

              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Enter Password",
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: Icon(Iconsax.eye, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, bottomNavPage);
                  },
                  child: Text("Log in",style: TextStyle(height: 0,),),
                ),
              ),
              SizedBox(height: 25.h),
              Center(
                child: Text(
                  "or",
                  style: TextStyle(
                    height: 0,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              socialLogin(type: "Continue with Apple", logo: SvgAssets.apple),
              SizedBox(height: 12.h),
              socialLogin(type: "Continue with Google", logo: SvgAssets.google),
              SizedBox(height: 12.h),
              socialLogin(
                type: "Continue with Facebook",
                logo: SvgAssets.facebook,
              ),
              SizedBox(height: 139.h.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, loginScreen);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
