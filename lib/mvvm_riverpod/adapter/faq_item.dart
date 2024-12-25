import 'package:flutter/material.dart';

import '../../clean_mvvm_riverpod/core/colors.dart';
import 'faq_data.dart';

class FaqItemView {
  Widget itemVertical(BuildContext context, double width, DataFaq dataFaq, int index,bool isSelected,VoidCallback onTap) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        left: 20,
        top: 12,
        right: 20,
        bottom:isSelected ? 12 : 0,
      ),
      color: isSelected ? Colors.red.withOpacity(0.3) : colorF8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              verticalDirection: VerticalDirection.up,
              children: [
                Text(dataFaq.title,
                    textAlign: TextAlign.right, style: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSize(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn,
              child: Container(
                width: width,
                height: 1,
                color: Colors.grey.withOpacity(0.4),
              ))
        ],
      ),
    );
  }
}
