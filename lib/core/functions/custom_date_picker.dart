import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(BuildContext context) {
  return showDatePicker(
      context: context, firstDate: DateTime(2024), lastDate: DateTime(2028));
}
