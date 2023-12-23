import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationBarWidget extends StatelessWidget {
  final int currentPage;
  final ValueChanged<int> onTap;

  const CurvedNavigationBarWidget({
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentPage,
      height: 60.0,
      items: const <Widget>[
        Icon(Icons.home_outlined, size: 30),
        Icon(Icons.favorite, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: onTap,
      letIndexChange: (index) => true,
    );
  }
}
