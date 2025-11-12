import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({super.key});

  @override
  State<WalletTransactionScreen> createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  DateTime? selectedDate;

  String _formatDate(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textBlackColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayDate = selectedDate ?? DateTime.now();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wallet Transactions',
        isBackButtonVisible: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.textFieldFillColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.calendar,
                            color: AppColors.kPrimaryColor,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            _formatDate(displayDate),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Iconsax.arrow_down_1,
                        size: 24.sp,
                        color: AppColors.iconColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            Text(
              "Recent activity",
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.textFieldFillColor, height: 2.h),
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return paymentTile(isCredit: index % 2 == 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentTile({required bool isCredit}) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          children: [
            SvgPicture.asset((isCredit ? SvgAssets.credit : SvgAssets.debit)),
            SizedBox(width: 12.w),
            Text(
              "Wallet funded",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGreyColor,
              ),
            ),
            Spacer(),
            Text(
              "\$ 245",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isCredit ? AppColors.kPrimaryColor : Color(0xffDF1D42),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
