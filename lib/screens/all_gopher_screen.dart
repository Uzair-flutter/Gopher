import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/bottom_sheets/filter_bottom_sheet.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';

class AllGopherScreen extends StatelessWidget {
  const AllGopherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Gopher',
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
                height: 500.h,
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 10.h),
                  itemCount: gophers.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                  itemBuilder: (context, index) {
                    return GopherTile(
                      gopher: gophers[index],
                      onTap: () async {
                        final filters = await FilterBottomSheet.show(context);
                      },
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
