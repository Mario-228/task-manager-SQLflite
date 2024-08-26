import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';

abstract class DatabaseServicesStates {
  const DatabaseServicesStates();
}

class DatabaseServicesInitial extends DatabaseServicesStates {}

class DeleteTasksLoadingState extends DatabaseServicesStates {}

class DeleteTasksSuccessState extends DatabaseServicesStates {
  final int id;

  DeleteTasksSuccessState({required this.id});
}

class DeleteTasksErrorState extends DatabaseServicesStates {
  final String message;

  DeleteTasksErrorState({required this.message});
}

class GetTasksLoadingState extends DatabaseServicesStates {}

class GetTasksSuccessState extends DatabaseServicesStates {
  final List<TaskModel> tasks;
  const GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends DatabaseServicesStates {
  final String message;
  const GetTasksErrorState({required this.message});
}

class AddTaskColorState extends DatabaseServicesStates {
  AddTaskColorState();
}

class AddTaskLoadingState extends DatabaseServicesStates {}

class AddTaskSuccessState extends DatabaseServicesStates {
  final int rowIndex;
  const AddTaskSuccessState({required this.rowIndex});
}

class AddTaskErrorState extends DatabaseServicesStates {
  final String message;
  const AddTaskErrorState({required this.message});
}

class UpdateTaskLoadingState extends DatabaseServicesStates {}

class UpdateTaskSuccessState extends DatabaseServicesStates {}

class UpdateTaskErrorState extends DatabaseServicesStates {
  final String message;
  const UpdateTaskErrorState({required this.message});
}

class SetDateState extends DatabaseServicesStates {
  const SetDateState();
}
