import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking Detail"),
      body: Stack(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.r),
            ),
          )
        ],
      ),
    );
  }
}