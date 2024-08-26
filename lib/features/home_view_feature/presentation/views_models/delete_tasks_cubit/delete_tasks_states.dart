abstract class DeleteTasksStates {
  const DeleteTasksStates();
}

class DeleteTasksInitialState extends DeleteTasksStates {}

class DeleteTasksLoadingState extends DeleteTasksStates {}

class DeleteTasksSuccessState extends DeleteTasksStates {
  final int id;

  DeleteTasksSuccessState({required this.id});
}

class DeleteTasksErrorState extends DeleteTasksStates {
  final String message;

  DeleteTasksErrorState({required this.message});
}
