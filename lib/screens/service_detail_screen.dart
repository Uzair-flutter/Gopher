import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

import '../utils/color_constant.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Overview', 'Services', 'Photos', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Home Cleaning', isBackButtonVisible: true),
      body: Column(
        children: [
          // Custom AppBar
          // _buildAppBar(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Image with Profile
                  _buildBannerWithProfile(),

                  // Service Info Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        _buildServiceInfo(),
                        SizedBox(height: 16.h),
                        _buildServiceTypeCard(),
                        SizedBox(height: 16.h),
                        _buildTabBar(),
                        SizedBox(height: 16.h),
                        _buildAboutSection(),
                        SizedBox(height: 100.h), // Space for bottom bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Book Now Bar
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: MediaQuery.of(context).padding.top + 16.h,
        bottom: 16.h,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Color(0xFFF6F8F9),
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFEFF2F1), width: 0.76),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16.sp,
                color: AppColors.textBlackColor,
              ),
            ),
          ),
          Text(
            'Home Cleaner',
            style: TextStyle(
              height: 0,
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 32.w), // Placeholder for symmetry
        ],
      ),
    );
  }

  Widget _buildBannerWithProfile() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Banner Image
        Container(
          width: double.infinity,
          height: 133.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(DummyAssets.serviceDetail),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Profile Image
        Positioned(
          left: 24.w,
          bottom: -41.h,
          child: Container(
            width: 82.w,
            height: 82.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kPrimaryColor, width: 2),
              image: DecorationImage(
                image: AssetImage(DummyAssets.person),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Message Icon
        Positioned(
          right: 24.w,
          bottom: -40.h,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: Color(0xFFF6F8F9),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xFFEEEFF3), width: 1),
            ),
            child: Icon(
              Icons.chat_bubble_outline,
              size: 18.sp,
              color: AppColors.textBlackColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50.h), // Space for profile image
        // Service Type Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            'Home Cleaner',
            style: TextStyle(
              height: 0,
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // Provider Name with Verified Icon
        Row(
          children: [
            Text(
              'Christopher Smith',
              style: TextStyle(
                height: 0,
                color: Color(0xFF1E1E1E),
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.verified, size: 20.sp, color: Color(0xFF28609B)),
          ],
        ),

        SizedBox(height: 12.h),

        // Location and Rating
        Row(
          children: [
            // Location
            Icon(
              Icons.location_on,
              size: 18.sp,
              color: AppColors.textGreyColor.withOpacity(0.6),
            ),
            SizedBox(width: 3.w),
            Text(
              '1234 Elm Street (3.2 mi)',
              style: TextStyle(
                height: 0,
                color: Color(0xFF757273),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 14.w),

            // Rating
            Icon(Icons.star, size: 18.sp, color: Color(0xFFFFC627)),
            SizedBox(width: 3.w),
            Text(
              '4.4',
              style: TextStyle(
                height: 0,
                color: Color(0xFF757273),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceTypeCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF043F7C), Color(0xFF28609B)],
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Type',
                style: TextStyle(
                  height: 0,
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'House Cleaning Services',
                style: TextStyle(
                  height: 0,
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              //widget.service.isActive ?
              'Active',
              style: TextStyle(
                height: 0,
                color: Color(0xFF28609B),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8F9),
        border: Border.all(color: Color(0xFFEEEFF3), width: 1),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selectedTabIndex == index
                      ? Color(0xFFE1F1EA)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 0,
                    color: selectedTabIndex == index
                        ? AppColors.kPrimaryColor
                        : Color(0xFF1E1E1E),
                    fontSize: 12.sp,
                    fontWeight: selectedTabIndex == index
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Christopher',
          style: TextStyle(
            height: 0,
            color: Color(0xFF1E1E1E),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'I believe a clean home is a happy home. Led by Christopher and backed by years of experience in the cleaning industry, we specialize in providing top-notch cleaning services tailored to meet the unique needs of each client. Whether you\'re looking for routine cleaning, a deep scrub, eco-friendly solutions, or post-construction cleanup, we\'ve got you covered.',
          style: TextStyle(
            color: Color(0xFF757273),
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            height: 1.62,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 74,
            offset: Offset(20, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  height: 0,
                  color: Color(0xFF757273),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$25',
                      style: TextStyle(
                        height: 0,
                        color: Color(0xFF1E1E1E),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '/hour',
                      style: TextStyle(
                        height: 0,
                        color: Color(0xFF777777),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Book Now Button
          GestureDetector(
            onTap: () {
              // Handle book now
            },
            child: Container(
              width: 210.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryColor.withOpacity(0.16),
                    blurRadius: 12,
                    offset: Offset(0, 12),
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send, size: 20.sp, color: Colors.white),
                  SizedBox(width: 10.w),
                  Text(
                    'Book Now',
                    style: TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
