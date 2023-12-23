import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/categorypage.dart';
import 'package:getwallpaper/screens/favoritescreen.dart';
import 'package:getwallpaper/screens/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State <BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
     CategoryPage(),
    const FavoritesScreen(),
  ];
  void _handleTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );

    if (index == 0) {
      // Navigate to HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      // Navigate to CategoryPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryPage()),
      );
    } else if (index == 2) {
      // Navigate to LoginScreen (replace with your login page widget)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.yellow,
            activeColor: Colors.yellow,
            gap: 8,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.collections_outlined,
                text: 'Collections',
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: 'Favorites',

              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index){
              _handleTabChange(index);


    }
        ),
        )
      );

  }
}
