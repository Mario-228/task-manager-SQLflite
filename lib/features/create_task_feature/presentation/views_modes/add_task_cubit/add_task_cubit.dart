import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_hive/core/database_sevice/database_helper.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_hive/features/create_task_feature/presentation/views_modes/add_task_cubit/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit() : super(AddTaskInitialState());

  static AddTaskCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;

  void setColorIndex(int index) {
    selectedIndex = index;
    emit(AddTaskColorState());
  }

  Future<void> addTask(TaskModel model) async {
    emit(AddTaskLoadingState());
    DatabaseHelper.insertData(model).then((value) {
      emit(AddTaskSuccessState(rowIndex: value));
    }).catchError((error) {
      emit(AddTaskErrorState(message: error.toString()));
    });
  }
}
