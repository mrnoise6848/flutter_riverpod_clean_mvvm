import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../adapter/faq_data.dart';
import '../model/notification_model.dart';

class NotificationViewModel extends StateNotifier<NotificationModel> {
  NotificationViewModel() : super(NotificationModel());

  void updateLoadingView(bool newValue) {
    state = state.copyWith(loadingView: newValue);
  }

  void updateIncreaseCounter(int newValue) {
    state = state.copyWith(counter: newValue);
  }

  void updateDecreseCounter(int newValue) {
    state = state.copyWith(counter: newValue);
  }

  void updateSelectedFaq(int index) {
    state = state.copyWith(selectFaq: index);
  }

  Future<void> getFaq(BuildContext context) async {
    try {
        List<DataFaq> newFaqList = [];
        state.copyWith(dataFaq: []);
        int a = 0;
       while(a < 3){
         var getFaq = DataFaq();
         getFaq.title = "item #$a";
         getFaq.description = "hhhh";
         newFaqList.add(getFaq);
         a +=1;
       }
        state = state.copyWith(dataFaq: newFaqList);
       updateLoadingView(false);
    } catch (e) {
      print("getFaq() catch : $e");
    }
  }

}


