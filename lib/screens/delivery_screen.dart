import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/widgets/bottom_shadow_bar.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:gopher/widgets/ride_tile.dart';

class DeliveryScreen extends StatefulWidget {
  DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  List<String> deliveryTypes = ["Food", "Pharmacy"];
  bool carSelected = false;
  bool bikeSelected = true;
  bool truckSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Delivery"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              SizedBox(
                height: 253.h,
                child: Image.asset(DummyAssets.deliveryMap, fit: BoxFit.fill),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            bikeSelected = true;
                            truckSelected = false;
                            carSelected = false;
                          }),
                          child: RideTile(
                            imageUrl: PngAssets.bike,
                            title: "Bike",
                            price: "\$45",
                            isSelected: bikeSelected,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            carSelected = true;
                            bikeSelected = false;
                            truckSelected = false;
                          }),
                          child: RideTile(
                            imageUrl: PngAssets.car,
                            title: "Car",
                            price: "\$60",
                            isSelected: carSelected,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            truckSelected = true;
                            carSelected = false;
                            bikeSelected = false;
                          }),
                          child: RideTile(
                            imageUrl: PngAssets.truck,
                            title: "Truck",
                            price: "\$90",
                            isSelected: truckSelected,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    addressFeild(
                      label: "Pickup Address",
                      address: "Lorem ipsum dolor sit amet, consectetur",
                    ),
                    SizedBox(height: 20.h),
                    addressFeild(
                      label: "Dropoff Address",
                      address: "Lorem ipsum dolor sit amet, consectetur",
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Request Delivery",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "upto 5 kg",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              deliveryTypeTile(type: "Food"),
                              SizedBox(width: 10.w),
                              deliveryTypeTile(type: "Pharmacy"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Comments for Gopher",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis. Ut nascetur elementum orci dictumst tempus tristique viverra aliquam dui. Semper eget lobortis pharetra facilisis cursus porttitor. Non, neque eget facilisis interdum molestie est.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, searchForRider);
          },
          child: Text("Continue"),
        ),
      ),
    );
  }

  Widget deliveryTypeTile({required String type}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.5.h),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        type,
        style: TextStyle(
          height: 0,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }

  Widget addressFeild({required String address, required String label}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              height: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            address,
            style: TextStyle(
              height: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
