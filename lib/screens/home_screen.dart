import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/color_constant.dart';

import '../utils/assets.dart';
import '../widgets/custom_appbar_home.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';
import '../widgets/home_carousel_widget.dart';
import '../widgets/service_item_widget.dart';

class ServicesData {
  static final List<ServiceItem> services = [
    ServiceItem(
      icon: SvgAssets.appliance,
      label: 'Appliance',
      isSelected: true,
    ),
    ServiceItem(
      icon: SvgAssets.repairing,
      label: 'Painting',
      isSelected: false,
    ),
    ServiceItem(icon: SvgAssets.shifting, label: 'Shifting', isSelected: false),
    ServiceItem(icon: SvgAssets.cleaning, label: 'Cleaning', isSelected: false),
    ServiceItem(icon: SvgAssets.ac, label: 'AC Clean', isSelected: false),
    ServiceItem(icon: SvgAssets.massage, label: 'Massage', isSelected: false),
    ServiceItem(icon: SvgAssets.laundry, label: 'Laundry', isSelected: false),
    ServiceItem(icon: SvgAssets.beauty, label: 'Beauty', isSelected: false),
  ];
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Ensure first index is selected by default
    // Reset all services and set first one as selected
    for (int i = 0; i < ServicesData.services.length; i++) {
      ServicesData.services[i].isSelected = (i == 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomSearchBar(),
              ),
              // SizedBox(height: 8.h),
              HomeCarouselWidget(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  // height: 158.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    //    color: Colors.red,
                    // image: DecorationImage(
                    //   image: AssetImage(DummyAssets.map),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Image.asset(
                    DummyAssets.map,
                    fit: BoxFit.cover,
                    // height: 185.h,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Our Services',
                  style: TextStyle(
                    height: 0,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              // ServicesSection(
              //   services: [
              //     ServiceItem(icon: Icons.kitchen, label: 'Appliance'),
              //     ServiceItem(icon: Icons.format_paint, label: 'Painting'),
              //     ServiceItem(icon: Icons.local_shipping, label: 'Shifting'),
              //     ServiceItem(icon: Icons.cleaning_services, label: 'Cleaning'),
              //     ServiceItem(icon: Icons.ac_unit, label: 'AC Clean'),
              //     ServiceItem(icon: Icons.spa, label: 'Massage'),
              //     ServiceItem(
              //       icon: Icons.local_laundry_service,
              //       label: 'Laundry',
              //     ),
              //     ServiceItem(icon: Icons.face, label: 'Beauty'),
              //   ],
              //   onViewAll: () {
              //     // Navigate to all services page
              //     print('View All tapped');
              //   },
              // ),
              _buildServicesSection(context),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Nearby',
                      style: TextStyle(
                        height: 0,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, allGopherScreen);
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          height: 0,
                          fontSize: 14.sp,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 35.h),
                itemCount: 1,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return GopherTile(
                    gopher: gophers[index],
                    onTap: () {
                      Navigator.pushNamed(context, serviceDetailScreen);
                    },
                  );
                },
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   child: GopherTile(
              //     gopher: GopherModel(
              //       name: 'Christopher Smith',
              //       imageUrl: DummyAssets.person,
              //       profession: 'Electrician',
              //       rating: 4.9,
              //       services: ['Electric', 'Plumbing', 'Repair'],
              //       additionalServicesCount: 3,
              //       pricePerHour: 25,
              //       isAvailable: true,
              //       isVerified: true,
              //     ),
              //     onTap: () {
              //       // Navigate to gopher detail page
              //       print('Gopher tile tapped');
              //     },
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Top Professionals',
                      style: TextStyle(
                        height: 0,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, allGopherScreen);
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          height: 0,
                          fontSize: 14.sp,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 35.h),
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return GopherTile(
                    gopher: gophers[index],
                    onTap: () {
                      Navigator.pushNamed(context, serviceDetailScreen);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return SizedBox(
      height: 71.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ServicesData.services.length,
        itemBuilder: (context, index) {
          final service = ServicesData.services[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20.0 : 0,
              right: index == ServicesData.services.length - 1 ? 20.0 : 24.0,
            ),
            child: ServiceItemWidget(
              service: service,
              onTap: () {
                setState(() {
                  // Deselect all services
                  for (int i = 0; i < ServicesData.services.length; i++) {
                    ServicesData.services[i].isSelected = false;
                  }
                  // Select the tapped service
                  ServicesData.services[index].isSelected = true;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
