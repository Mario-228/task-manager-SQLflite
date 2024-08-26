import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_hive/core/styles/styles.dart';
import 'package:task_manager_hive/core/widgets/custom_text_button.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/color_section.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/date_time_form_field_section.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/drop_down_button_section.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views/widgets/text_form_field_section.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_cubit.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_states.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = DateTime.now();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add Task", style: Styles.textStyle30),
              const SizedBox(height: 20),
              const TextFormFieldSection(),
              const DateTimeFormFieldSection(),
              const DropDownButtonSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const ColorSection(),
                  BlocBuilder<DatabaseServicesCubit, DatabaseServicesStates>(
                    builder: (context, state) => CustomTextButton(
                        text: "Create Task",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            DatabaseServicesCubit.get(context)
                                .addTask(
                              TaskModel(
                                title:
                                    TextFormFieldSection.titleController.text,
                                note: TextFormFieldSection.noteController.text,
                                date: TextFormFieldSection.dateController.text,
                                startTime:
                                    DateTimeFormFieldSection.startTime.text,
                                endTime: DateTimeFormFieldSection.endTime.text,
                                remind: DropDownButtonSection.selectedReminder,
                                repeat: DropDownButtonSection.selectedRepeat,
                                color: DatabaseServicesCubit.get(context)
                                    .selectedIndex,
                                isCompleted: 0,
                              ),
                            )
                                .then((value) {
                              Navigator.pop(context);
                            });
                          }
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
