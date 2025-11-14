import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomShadowBar extends StatelessWidget {
  final Widget child;
  final bool addPadding;
  const BottomShadowBar({
    super.key,
    required this.child,
    this.addPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h + MediaQuery.paddingOf(context).bottom,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(20, 0),
            blurRadius: 74,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.15),
          ),
        ],
        color: Colors.white,
      ),
      padding: addPadding
          ? EdgeInsets.symmetric(horizontal: 24.w)
          : EdgeInsets.zero,
      child: Center(
        child: SizedBox(height: 56.h, width: double.infinity, child: child),
      ),
    );
  }
}
