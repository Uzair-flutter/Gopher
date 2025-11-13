import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gopher/utils/assets.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/color_constant.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/dialog box/booking_success_dailog_box.dart';

class BookingReviewScreen extends StatefulWidget {
  const BookingReviewScreen({super.key});

  @override
  State<BookingReviewScreen> createState() => _BookingReviewScreenState();
}

class _BookingReviewScreenState extends State<BookingReviewScreen> {
  bool deductFromWallet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Review Summary', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xFFEEEFF3),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.asset(
                            DummyAssets.serviceDetail,
                            fit: BoxFit.fill,
                            height: 71.h,
                            width: 81.w,
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Content section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'House Cleaner',
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.star1,
                                        size: 18.sp,
                                        color: Color(0xffFFC627),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                          height: 0,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textBlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),

                              Row(
                                children: [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),

                              // Row 3: Price + Distance
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$22",
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlackColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.location,
                                        size: 18.sp,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '3.2 mile',
                                        style: TextStyle(
                                          height: 0,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textBlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 20.h),
                    Column(
                      spacing: 15.h,
                      children: [
                        _bookingDetailRow('Date ', '14 Oct 2025'),
                        _bookingDetailRow('Time', '11:00 AM'),

                        // _bookingDetailRow('Working Hours', '2 Hours'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Worker',
                              style: TextStyle(
                                height: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGreyColor,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(DummyAssets.servicePerson),
                                SizedBox(width: 5.w),
                                Text(
                                  'Jan McCafferty',
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Visiting Charges",
                              style: TextStyle(
                                height: 0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGreyColor,
                              ),
                            ),
                            Text(
                              "\$23",
                              style: TextStyle(
                                height: 0,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlackColor,
                              ),
                            ),
                          ],
                        ),
                        if (deductFromWallet)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Wallet deduction",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kSecondaryColor,
                                ),
                              ),
                              Text(
                                "\$23",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            height: 0,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        Text(
                          '\$23',
                          style: TextStyle(
                            height: 0,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 22.h),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xFFEEEFF3),
              ),
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(SvgAssets.stripe),
                  Text(
                    '\$23',
                    style: TextStyle(
                      height: 0,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.5.h),
            deductFromWallet
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        deductFromWallet = false;
                      });
                    },
                    child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        "Clear wallet Deduction",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffD72547),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        deductFromWallet = true;
                      });
                    },
                    child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.wallet,
                            color: AppColors.kSecondaryColor,
                          ),
                          Text(
                            "Deduct from wallet",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            showCustomDialog(
              context,
              svgPath: SvgAssets.tickMark,
              title: 'Booking Successful',
              message:
                  'You have successfully made payment\nand book the services',
              primaryButtonText: 'View E- Receipt',
              onPrimaryPressed: () {
                Navigator.pushNamed(context, eReceiptScreen);
              },
              secondaryButtonText: 'Message Gopher',
              onSecondaryPressed: () {
                Navigator.pop(context);
                // Your action here
              },
              primaryButtonColor: AppColors.kPrimaryColor,
            );
          },
          child: Text('Confirm Payment'),
        ),
      ),
    );
  }

  Widget _bookingDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textGreyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }
}
