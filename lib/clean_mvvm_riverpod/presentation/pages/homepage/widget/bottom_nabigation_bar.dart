import 'package:flutter/material.dart';
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
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 4),
                    Icon(
                      _BottomNavItems.icons[index],
                      color: isSelected ? Colors.blue : Colors.grey,
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
  static const List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.person,
  ];

  static List<String> labels = [
    L.appName,
    "Search",
    "Profile",
  ];
}
