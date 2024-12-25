import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../adapter/faq_item.dart';
import '../utils/providers.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationPage();
}

class _NotificationPage extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    final model = ref.watch(notificationPageProvider);
    final viewModel = ref.read(notificationPageProvider.notifier);

    return Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.counter.toString()),
            GestureDetector(
              onTap: () {
                viewModel.updateIncreaseCounter(model.counter + 1);
              },
              child: Text("Increase"),
            ),
            GestureDetector(
              onTap: () {
                viewModel.updateDecreseCounter(model.counter - 1);
              },
              child: Text("Increase"),
            ),
            GestureDetector(
              onTap: () {
                viewModel.getFaq(context);
              },
              child: Text("Notifications"),
            ),
            Expanded(
              child: ListView.builder(
                // حذف NeverScrollableScrollPhysics
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: false,
                itemCount: model.dataFaq.length,
                itemBuilder: (BuildContext context, int index) {
                  return FaqItemView().itemVertical(
                    context,
                    width,
                    model.dataFaq[index],
                    index,
                    model.selectFaq == index,
                        () {
                      viewModel.updateSelectedFaq(index);
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
