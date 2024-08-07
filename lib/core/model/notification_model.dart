class NotificationModel {
  final String notificatoinText;
  final String description;
  bool isUnread;

  NotificationModel(
      {required this.description,
      required this.notificatoinText,
      this.isUnread = true});
}
