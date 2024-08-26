import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: const Color.fromARGB(255, 37, 77, 252)),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
