import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/core/widgets/default_form_field.dart';

class DateTimeFormFieldSection extends StatelessWidget {
  const DateTimeFormFieldSection({super.key});
  static TextEditingController startTime = TextEditingController();
  static TextEditingController endTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    startTime.clear();
    endTime.clear();
    return Row(
      children: [
        Expanded(
          child: DefaultFormField(
            type: TextInputType.datetime,
            controller: startTime,
            isPassword: false,
            onError: "Required",
            hintText: "11:00 AM",
            title: "Start Time",
            suffixIcon: Icons.access_time_rounded,
            readOnly: true,
            onPressed: () {
              customTimePicker(context).then((value) {
                if (value != null) {
                  startTime.text = value.format(context);
                }
              });
            },
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: DefaultFormField(
            type: TextInputType.datetime,
            controller: endTime,
            isPassword: false,
            onError: "Required",
            hintText: "12:00 PM",
            title: "End Time",
            suffixIcon: Icons.access_time_rounded,
            readOnly: true,
            onPressed: () {
              customTimePicker(context).then((value) {
                if (value != null) {
                  endTime.text = value.format(context);
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Future<TimeOfDay?> customTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
