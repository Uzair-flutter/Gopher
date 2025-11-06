import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/utills/color_constant.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create New Account',
        isBackButtonVisible: false,
      ),
      body: const Center(child: Text('Create New Account Screen')),
    );
  }
}
