import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_hive/core/functions/custom_date_picker.dart';
import 'package:task_manager_hive/core/widgets/default_form_field.dart';

class TextFormFieldSection extends StatelessWidget {
  const TextFormFieldSection({super.key});
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController noteController = TextEditingController();
  static final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.clear();
    noteController.clear();
    dateController.clear();
    DateTime selectedDate = DateTime.now();

    return Column(
      children: [
        DefaultFormField(
            type: TextInputType.text,
            controller: titleController,
            isPassword: false,
            onError: "Title must not be empty",
            hintText: "Enter your title",
            title: "Title"),
        DefaultFormField(
            type: TextInputType.text,
            controller: noteController,
            isPassword: false,
            onError: "Notes must not be empty",
            hintText: "Enter your Notes",
            title: "Note"),
        DefaultFormField(
          type: TextInputType.datetime,
          controller: dateController,
          isPassword: false,
          onError: "Date must not be empty",
          hintText: DateFormat.yMd().format(selectedDate),
          title: "Date",
          suffixIcon: Icons.calendar_month_outlined,
          readOnly: true,
          onPressed: () async {
            DateTime? date = await customDatePicker(context);
            if (date != null) {
              dateController.text = DateFormat.yMd().format(date);
            }
          },
        ),
      ],
    );
  }
}
