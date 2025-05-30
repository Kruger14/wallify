import 'package:flutter/material.dart';
import 'package:wallify/presentation/screens/mainscreens/home_screen.dart';
import 'package:wallify/presentation/screens/mainscreens/settings_screen.dart';

class FloatingNavbar extends StatefulWidget {
  const FloatingNavbar({super.key});

  @override
  State<FloatingNavbar> createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex], // Main content
          
          // Floating Bottom Navbar
          Positioned(
            left: 60,
            right: 60,
            bottom: 10, // Position above bottom
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.home, "Home", 0),
                    _buildNavItem(Icons.settings, "Settings", 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.white : Colors.grey,
            size: 28,
          ),
        ],
      ),
    );
  }
}
