import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/view_models/ride_request_view_model.dart';
import 'package:gopher/widgets/bottomSheet/ride_request_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_app_bar.dart';

class SearchForRider extends StatelessWidget {
  const SearchForRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Searching For A Rider',
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Searching For A Rider',
      //     style: TextStyle(
      //       color: AppColors.textBlackColor,
      //       fontSize: 20.sp,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                DummyAssets.searchForRideMap,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Image.asset(
              DummyAssets.blueCircle,
              height: 252.h,
              width: 252.w,
              fit: BoxFit.contain,
            ),
            InkWell(
              onTap: () {
                context.read<RideRequestViewModel>().setRideList();
                showRidesRequestSheet(context);
              },
              child: Image.asset(
                DummyAssets.gopherOnMap,
                height: 54.h,
                width: 54.w,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
