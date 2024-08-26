abstract class AddTaskStates {
  const AddTaskStates();
}

class AddTaskInitialState extends AddTaskStates {}

class AddTaskColorState extends AddTaskStates {
  AddTaskColorState();
}

class AddTaskLoadingState extends AddTaskStates {}

class AddTaskSuccessState extends AddTaskStates {
  final int rowIndex;
  const AddTaskSuccessState({required this.rowIndex});
}

class AddTaskErrorState extends AddTaskStates {
  final String message;
  const AddTaskErrorState({required this.message});
}
