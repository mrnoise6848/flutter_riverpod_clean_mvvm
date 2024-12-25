
import '../adapter/faq_data.dart';

class NotificationModel {
  final bool loadingView;
  final int counter;
  final int selectFaq;
  final List<DataFaq> dataFaq;

  NotificationModel({
    this.loadingView = false,
    this.counter = 0,
    this.selectFaq = 0,
    this.dataFaq = const [],
  });

  NotificationModel copyWith({
    bool? loadingView,
    int? counter,
    int? selectFaq,
    List<DataFaq>? dataFaq,
  }) {
    return NotificationModel(
      loadingView: loadingView ?? this.loadingView,
      counter: counter ?? this.counter,
      selectFaq: selectFaq ?? this.selectFaq,
      dataFaq: dataFaq ?? this.dataFaq,
    );
  }
}

