import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';

abstract class GetTasksStates {
  const GetTasksStates();
}

class GetTasksInitialState extends GetTasksStates {}

class GetTasksLoadingState extends GetTasksStates {}

class GetTasksSuccessState extends GetTasksStates {
  final List<TaskModel> tasks;
  const GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends GetTasksStates {
  final String message;
  const GetTasksErrorState({required this.message});
}
