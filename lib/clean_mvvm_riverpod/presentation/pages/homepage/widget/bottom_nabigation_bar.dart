import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/images.dart';
import 'package:test_riverpod/main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 4),
                    SvgPicture.asset(
                      _BottomNavItems.icons[index],
                      color: isSelected ? Colors.blue : Colors.grey,
                      width: 24,
                      height: 24,
                    ),
                    Text(
                      _BottomNavItems.labels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: 0,
          left: selectedIndex * (MediaQuery.of(context).size.width / 3),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 4,
            width: MediaQuery.of(context).size.width / 3,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class _BottomNavItems {
  static List<String> icons = [
    Images.homeSmile,
    Images.calenderPlus,
    Images.coin,
    Images.comment,
    Images.other,
  ];

  static List<String> labels = [
    L.home,
    L.calender,
    L.accounting,
    L.comments,
    L.others,
  ];
}
