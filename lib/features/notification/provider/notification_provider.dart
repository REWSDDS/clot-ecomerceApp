import 'package:alfa/core/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> notifcations = [
    NotificationModel(
      notificatoinText: 'New Message',
      description: 'You have new message from Clot'
    ),
    NotificationModel(
      notificatoinText: 'Meeting Reminder',
      description: 'You have to meet'
    ),
    NotificationModel(
      notificatoinText: 'Siz uchun yangi chegirma 70 %',
      description: 'Siz uchun yangi chegirma 70 % kelaqoling tezroq :)'
    ),
  ];

  void readNotificatoin(int index) {
    notifcations[index].isUnread = false;
    notifyListeners();
  }

  void deleteNotificaton(int index) {
    notifcations.removeAt(index);
    notifyListeners();
  }
}
