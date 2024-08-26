import 'package:flutter/material.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/create_task_view_body.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/custom_task_view_app_bar.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomTaskViewAppBar(),
      body: CreateTaskViewBody(),
    );
  }
}
