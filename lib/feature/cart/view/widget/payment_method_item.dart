import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, this.isActive = false, required this.icon});

  final bool isActive;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 103.w,
      height: 62.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.50, color: isActive ? Color(0xFF34A853) : Colors.grey),
          borderRadius: BorderRadius.circular(15.r),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? Color(0xFF34A853) : Colors.white,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: icon,
      ),
    );
  }
}
