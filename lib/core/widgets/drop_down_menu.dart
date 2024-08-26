import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/core/styles/styles.dart';

class CustomDropDownMenu<param> extends StatelessWidget {
  final String title;
  final TextInputType type;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  final TextEditingController controller;
  final bool isPassword;
  final String onError;
  final bool autofocus;
  final String hintText;
  final bool readOnly;
  final void Function(dynamic)? onChanged;
  final List<DropdownMenuItem<param>> items;
  const CustomDropDownMenu(
      {super.key,
      required this.type,
      this.suffixIcon,
      this.onPressed,
      required this.controller,
      required this.isPassword,
      required this.onError,
      this.autofocus = false,
      required this.hintText,
      this.readOnly = false,
      required this.title,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.textStyle18),
        SizedBox(height: 8.h),
        TextFormField(
          autofocus: autofocus,
          validator: (value) => value!.isEmpty ? onError : null,
          obscureText: isPassword,
          controller: controller,
          keyboardType: type,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Styles.textStyle14,
            contentPadding: const EdgeInsets.all(15.0),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: DropdownButton<param>(
              items: items,
              onChanged: onChanged,
              iconSize: 32.h,
              elevation: 4,
              style: Styles.textStyle14,
              underline: const SizedBox(),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
