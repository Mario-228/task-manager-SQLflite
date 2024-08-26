abstract class NotificationStates {
  const NotificationStates();
}

class NotificationInitialState extends NotificationStates {}

class NotificationCreateState extends NotificationStates {}

class IOSNotificationPermissionState extends NotificationStates {}

class NotificationChangeState extends NotificationStates {}

class DisplayNotificationState extends NotificationStates {}

class SecheduledNotificationState extends NotificationStates {}
