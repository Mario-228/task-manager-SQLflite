import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/app_bar_and_add_task.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/date_picker.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/todo_listview/todo_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDate = DateTime.now();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarAndAddTask(
              selectDate: selectedDate,
            ),
            SizedBox(height: 10.h),
            CustomDatePicker(
              selectedDate: selectedDate,
            ),
            SizedBox(height: 10.h),
            const TodoListview()
          ],
        ),
      ),
    );
  }
}
