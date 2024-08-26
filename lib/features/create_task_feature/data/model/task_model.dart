import 'package:hive/hive.dart';
import 'package:task_manager_hive/core/database_sevice/database_constants.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? note;

  @HiveField(3)
  int? isCompleted;

  @HiveField(4)
  String? date;

  @HiveField(5)
  String? startTime;

  @HiveField(6)
  String? endTime;

  @HiveField(7)
  int? color;

  @HiveField(8)
  int? remind;

  @HiveField(9)
  String? repeat;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.remind,
    required this.repeat,
  });

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json[DatabaseConstants.taskTitleColumnName],
      note: json[DatabaseConstants.taskNoteColumnName],
      isCompleted: json[DatabaseConstants.taskIsCompletedColumnName],
      date: json[DatabaseConstants.taskDateColumnName],
      startTime: json[DatabaseConstants.taskStartTimeColumnName],
      endTime: json[DatabaseConstants.taskEndTimeColumnName],
      color: json[DatabaseConstants.taskColorColumnName],
      remind: json[DatabaseConstants.taskRemindColumnName],
      repeat: json[DatabaseConstants.taskRepeatColumnName],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      DatabaseConstants.taskTitleColumnName: title,
      DatabaseConstants.taskNoteColumnName: note,
      DatabaseConstants.taskDateColumnName: date,
      DatabaseConstants.taskStartTimeColumnName: startTime,
      DatabaseConstants.taskEndTimeColumnName: endTime,
      DatabaseConstants.taskRemindColumnName: remind,
      DatabaseConstants.taskRepeatColumnName: repeat,
      DatabaseConstants.taskColorColumnName: color,
      DatabaseConstants.taskIsCompletedColumnName: isCompleted,
    };
  }
}
