import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_hive/core/notification_service/notification_service.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/notification_cubit/notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit(this.notificationService)
      : super(NotificationInitialState());
  final NotificationService notificationService;
  static NotificationCubit get(context) => BlocProvider.of(context);

  void createNotification(BuildContext context) {
    notificationService.initialNotification(context);
    if (Platform.isIOS) {
      requestIOSPermissions();
    }
    emit(NotificationCreateState());
  }

  void requestIOSPermissions() {
    notificationService.requestIOSPermissions();
    emit(IOSNotificationPermissionState());
  }

  void displayNotification({required String title, required String body}) {
    notificationService.displayNotification(title: title, body: body);
    emit(DisplayNotificationState());
  }

  void secheduleNotification() {
    notificationService.scheduleNotification().then((value) {
      emit(SecheduledNotificationState());
    });
  }
}
