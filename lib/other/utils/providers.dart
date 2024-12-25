import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../model/default_model.dart';
import '../model/notification_model.dart';
import '../view_model/default_view_model.dart';
import '../view_model/notification_view_model.dart';

final defaultPageProvider = StateNotifierProvider<DefaultViewModel, DefaultModel>(
      (ref) => DefaultViewModel(),
);

final notificationPageProvider = StateNotifierProvider<NotificationViewModel, NotificationModel>(
        (ref) => NotificationViewModel()
);

final notificationPagezProvider = StateNotifierProvider<NotificationViewModel,NotificationModel>(
    (ref) => NotificationViewModel()
);
