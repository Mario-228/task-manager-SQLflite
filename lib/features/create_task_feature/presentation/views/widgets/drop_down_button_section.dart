import 'package:flutter/material.dart';
import 'package:task_manager_hive/core/widgets/drop_down_menu.dart';

class DropDownButtonSection extends StatelessWidget {
  const DropDownButtonSection({super.key});

  static int selectedReminder = 0;
  static String selectedRepeat = "None";
  @override
  Widget build(BuildContext context) {
    TextEditingController reminderController = TextEditingController();
    TextEditingController repeatController = TextEditingController();
    const List<int> reminderList = [5, 10, 15, 20];
    const List<String> repeatOptionsList = [
      "None",
      "Daily",
      "Weekly",
      "Monthly"
    ];
    return Column(
      children: [
        CustomDropDownMenu<String>(
          readOnly: true,
          type: TextInputType.text,
          controller: reminderController,
          isPassword: false,
          onError: "required",
          hintText: "5 minutes earlier",
          title: "Remind",
          items: reminderList
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    "$value minutes earlier",
                    style: TextStyle(
                      color: ThemeData.from(
                              colorScheme: Theme.of(context).colorScheme)
                          .colorScheme
                          .onSurface,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              selectedReminder = int.parse(value);
              reminderController.text = "$value minutes earlier";
            }
          },
        ),
        CustomDropDownMenu<String>(
          readOnly: true,
          type: TextInputType.text,
          controller: repeatController,
          isPassword: false,
          onError: "required",
          hintText: "None",
          title: "Repeat",
          items: repeatOptionsList
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: ThemeData.from(
                              colorScheme: Theme.of(context).colorScheme)
                          .colorScheme
                          .onSurface,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              selectedRepeat = value;
              repeatController.text = value;
            }
          },
        ),
      ],
    );
  }
}
