import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/widgets/ride_request_tile.dart';

void showRidesRequestSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.w,
              right: 20.w,
              top: 10.h,
            ),
            child: SizedBox(
              height: 627.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 48.w,
                        margin: EdgeInsets.only(bottom: 30.h),
                        decoration: BoxDecoration(
                          color: Color(0xffCDCFD0),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                    ),

                    // Review text
                    Center(
                      child: Text(
                        "Current Offers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),
                    Divider(color: Colors.grey[200]!),
                    SizedBox(height: 24.h),
                    RideRequestTile(
                      onAccept: (){
                        Navigator.pushNamed(context, rideDetailScreen);
                      },
                      onDecline: (){},
                      riderName: "Christopher Smith",
                      riderImage: DummyAssets.person,
                      rating: 4.4,
                      price: 13.99,
                      time: "4 mins",
                    ),
                    SizedBox(height: 20.h),

                    RideRequestTile(
                       onAccept: (){
                        Navigator.pushNamed(context, rideDetailScreen);
                      },
                      onDecline: (){},
                      riderName: "Christopher Smith",
                      riderImage: DummyAssets.person,
                      rating: 4.4,
                      price: 13.99,
                      time: "4 mins",
                    ),
                    SizedBox(height: 20.h),
                    RideRequestTile(
                       onAccept: (){
                        Navigator.pushNamed(context, rideDetailScreen);
                      },
                      onDecline: (){},
                      riderName: "Christopher Smith",
                      riderImage: DummyAssets.person,
                      rating: 4.4,
                      price: 13.99,
                      time: "4 mins",
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
