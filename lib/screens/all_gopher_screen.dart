import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:gopher/utils/color_constant.dart';
import 'package:gopher/view_models/filter_view_model.dart';
import 'package:gopher/widgets/custom_app_bar.dart';
import 'package:gopher/widgets/service_item_widget.dart';

import '../utils/assets.dart';
import '../widgets/bottomSheet/filter_bottom_sheet.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';

class AllGopherScreen extends StatelessWidget {
  const AllGopherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flitterViewmodel = context.watch<FilterViewModel>().selectedFilters;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Professionals",
        showSearchIcon: true,
        actionIcon: SvgAssets.filter,
        onActionIconTap: () {
          FilterBottomSheet.show(context);
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: flitterViewmodel.isEmpty
                ? CustomSearchBar()
                : SizedBox.shrink(),
          ),

          if (flitterViewmodel.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0.h),
              child: SizedBox(
                height: 40.h,
                child: Consumer<FilterViewModel>(
                  builder: (context, filterViewModel, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: FilterViewModel.professionalServices.length,
                      itemBuilder: (context, index) {
                        final service =
                            FilterViewModel.professionalServices[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 20.0.w : 0.0,
                            right: 10.0.w,
                          ),
                          child: _buildChip(
                            service: service,
                            onTap: () {
                              filterViewModel.selectSingleService(
                                service.label,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),

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
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required ServiceItem service,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        padding: EdgeInsets.symmetric(vertical: 11.5.h, horizontal: 16.w),
        backgroundColor: service.isSelected
            ? AppColors.kPrimaryColor.withValues(alpha: 0.1)
            : AppColors.textFieldFillColor,
        avatar: SvgPicture.asset(
          service.icon,
          height: 18.w,
          width: 18.w,
          color: service.isSelected
              ? AppColors.kPrimaryColor
              : AppColors.iconColor,
        ),
        label: Text(
          service.label,
          style: TextStyle(
            height: 0,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: service.isSelected
                ? AppColors.kPrimaryColor
                : AppColors.textGreyColor,
          ),
        ),
      ),
    );
  }
}
