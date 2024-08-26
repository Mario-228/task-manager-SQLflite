import 'dart:async';

import 'package:hive/hive.dart';
import 'package:task_manager_hive/core/database_sevice/database_constants.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';

class DatabaseHelper {
  static Future<Box<TaskModel>> _openBox() async {
    return await Hive.openBox<TaskModel>(DatabaseConstants.boxName);
  }

  static Future<int> insertData(TaskModel task) async {
    var box = await _openBox();
    int key = await box.add(task);
    task.id = key;
    return key;
  }

  static Future<void> updateData(TaskModel task) async {
    // var box = await _openBox();
    await task.save();
  }

  static Future<void> deleteData(TaskModel task) async {
    // var box = await _openBox();
    await task.delete();
  }

  static Future<List<TaskModel>> getData() async {
    var box = await _openBox();
    return box.values.toList();
  }
}
