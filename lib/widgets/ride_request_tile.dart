import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/view_models/ride_request_view_model.dart';
import 'package:provider/provider.dart';

class RideRequestTile extends StatefulWidget {
  final String riderName;
  final String riderImage;
  final double rating;
  final double price;
  final String time;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final int index;

  const RideRequestTile({
    super.key,
    required this.riderName,
    required this.riderImage,
    required this.rating,
    required this.price,
    required this.time,
    required this.onAccept,
    required this.onDecline,
    required this.index,
  });

  @override
  State<RideRequestTile> createState() => _RideRequestTileState();
}

class _RideRequestTileState extends State<RideRequestTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

  
    _controller.forward();

  
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       widget.onDecline();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Center(
                  child: Image.asset(
                    widget.riderImage,
                    fit: BoxFit.cover,
                    height: 42.w,
                    width: 42.w,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.riderName,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        PngAssets.tickBadge,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.rating}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Text(
                    "${widget.time} mins",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation.value,
                backgroundColor: Colors.grey[300],
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(10.r),
              
              );
            },
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _controller.stop(); 
                    widget.onDecline();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey[200]!, width: 1.w),
                    ),
                    child: Center(
                      child: Text(
                        "Decline",
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _controller.stop();
                    widget.onAccept();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey[200]!, width: 2.w),
                    ),
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
