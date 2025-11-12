import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

import '../utils/assets.dart';
import '../widgets/bottom_sheets/filter_bottom_sheet.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';

class AllGopherScreen extends StatelessWidget {
  final String title;
  const AllGopherScreen({super.key, this.title = 'All Gopher'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showSearchIcon: true,
        actionIcon: SvgAssets.filter,
        onActionIconTap: () {
          FilterBottomSheet.show(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: 10.h + MediaQuery.paddingOf(context).bottom,
                ),
                itemCount: gophers.length,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemBuilder: (context, index) {
                  return GopherTile(gopher: gophers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
