import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/core/styles/styles.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_cubit.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_states.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({
    super.key,
  });

  static const List<Color> colors = [
    Colors.blueAccent,
    Colors.red,
    Color.fromARGB(255, 210, 189, 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Color", style: Styles.textStyle18),
            SizedBox(height: 10.h),
            BlocBuilder<DatabaseServicesCubit, DatabaseServicesStates>(
              builder: (context, state) => Row(
                children: List<Widget>.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        DatabaseServicesCubit.get(context).setColorIndex(index);
                      },
                      child: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: colors[index],
                        child:
                            DatabaseServicesCubit.get(context).selectedIndex ==
                                    index
                                ? const Icon(
                                    Icons.done,
                                  )
                                : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
