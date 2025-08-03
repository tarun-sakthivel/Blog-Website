import 'package:bolg_website/Screens/CreateBolg.dart';
import 'package:bolg_website/constants/text.dart';
import 'package:flutter/material.dart';

class WebNavbar extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  const WebNavbar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateBlog(),
                  ));
            },
            child: Image.asset(
              'assets/images/TS_Logo1.png',
              height: 40,
            ),
          ),
          Row(
            children: [
              _buildNavItem("Home", 0),
              const SizedBox(width: 30),
              _buildNavItem("My Blogs", 1),
              const SizedBox(width: 30),
              _buildNavItem("About", 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, currentIndex, _) {
        return InkWell(
          onTap: () => selectedIndex.value = index,
          child: Text(
            title,
            style: knormaltextStyle.copyWith(
              color: index == currentIndex ? Colors.orange : Colors.black,
              fontWeight:
                  currentIndex == index ? FontWeight.bold : FontWeight.normal,
              fontSize: 24,
            ),
          ),
        );
      },
    );
  }
}
