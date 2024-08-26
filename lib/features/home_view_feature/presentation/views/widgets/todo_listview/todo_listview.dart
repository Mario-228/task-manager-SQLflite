import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_cubit.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_states.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/todo_listview/todol_istview_item.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseServicesCubit, DatabaseServicesStates>(
      builder: (context, state) {
        if (state is GetTasksSuccessState) {
          return ListView.builder(
              itemCount: state.tasks.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                TaskModel model = state.tasks[index];
                if (DateFormat.yMd().format(
                        DatabaseServicesCubit.get(context).selectedDate) ==
                    model.date) {
                  return TaskItemBuilder(model: model);
                }
                if (model.repeat == "Daily") {
                  return TaskItemBuilder(model: model);
                } else {
                  return const SizedBox();
                }
              });
        } else if (state is GetTasksErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TodolIstviewItem(model: model),
    );
  }
}
