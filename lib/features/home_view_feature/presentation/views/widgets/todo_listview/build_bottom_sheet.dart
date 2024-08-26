import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_cubit.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_states.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/buttom.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<DatabaseServicesCubit, DatabaseServicesStates>(
            builder: (context, state) => model.isCompleted == 0
                ? ButtonSheetModel(
                    onPressed: () {
                      model.isCompleted = 1;
                      DatabaseServicesCubit.get(context)
                          .updateTask(task: model);
                      Navigator.pop(context);
                    },
                    txt: "Task Completed",
                    color: const Color.fromARGB(255, 37, 77, 252),
                  )
                : const SizedBox(),
          ),
          SizedBox(height: 10.h),
          BlocBuilder<DatabaseServicesCubit, DatabaseServicesStates>(
            builder: (context, state) => ButtonSheetModel(
              onPressed: () {
                DatabaseServicesCubit.get(context).deleteTask(task: model);
                Navigator.pop(context);
              },
              txt: "Delete Task",
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20.h),
          ButtonSheetModel(
            onPressed: () => Navigator.pop(context),
            txt: "Close",
            color: Colors.white,
            colorBorder: Colors.grey,
            colorTxt: Colors.black,
          ),
        ],
      ),
    );
  }
}
