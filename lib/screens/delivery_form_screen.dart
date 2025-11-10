import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/widgets/address_field.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

class DeliveryFormScreen extends StatelessWidget {
  const DeliveryFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Delivery'),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            AddressField(heading: 'Pickup Details'),
            AddressField(heading: 'Dropoff Details'),
          ],
        ),
      ),
    );
  }
}
