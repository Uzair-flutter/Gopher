import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/screens/service_detail_screen.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/service_tile_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  String selectedService = 'All';
  final List<String> services = ['All', 'Appliance', 'Repairing', 'Shifting'];
  final List<IconData?> serviceIcons = [
    null, // No icon for 'All'
    Icons.kitchen_outlined, // Appliance
    Icons.build_outlined, // Repairing
    Icons.local_shipping_outlined, // Shifting
  ];

  final List<ServiceCard> servicesList = [
    ServiceCard(
      serviceName: "Home Cleaner",
      providerName: "John Deo",
      price: "25",
      rating: "4.4",
      distance: "3.2 mile",
      imageUrl: DummyAssets.job,
    ),
    ServiceCard(
      serviceName: "Plumber",
      providerName: "Mike Smith",
      price: "30",
      rating: "4.8",
      distance: "1.5 mile",
      imageUrl: DummyAssets.job,
    ),
    ServiceCard(
      serviceName: "Electrician",
      providerName: "Sarah Johnson",
      price: "35",
      rating: "4.6",
      distance: "2.8 mile",
      imageUrl: DummyAssets.job,
    ),
    ServiceCard(
      serviceName: "Carpenter",
      providerName: "David Brown",
      price: "40",
      rating: "4.7",
      distance: "4.1 mile",
      imageUrl: DummyAssets.job,
    ),
    ServiceCard(
      serviceName: "Painter",
      providerName: "Emma Wilson",
      price: "28",
      rating: "4.5",
      distance: "2.3 mile",
      imageUrl: DummyAssets.job,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Services',
        showSearchIcon: true,
        actionIcon: Iconsax.filter,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: 18.h),
              SizedBox(
                height: 32.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    final icon = serviceIcons[index];
                    final isSelected = selectedService == service;
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedService = service;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xFFE8F5E9)
                                : Color(0xFFF6F8F9),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (icon != null)
                                  Icon(
                                    icon,
                                    size: 15.sp,
                                    color: isSelected
                                        ? AppColors.kPrimaryColor
                                        : AppColors.textGreyColor,
                                  ),
                                if (icon != null) SizedBox(width: 4.w),
                                Text(
                                  service,
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 12.sp,
                                    color: isSelected
                                        ? AppColors.kPrimaryColor
                                        : AppColors.textGreyColor,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                  itemCount: servicesList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == servicesList.length) {
                      return SizedBox(height: 50.h);
                    }
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: ServiceTileWidget(
                        service: servicesList[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceDetailScreen(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
