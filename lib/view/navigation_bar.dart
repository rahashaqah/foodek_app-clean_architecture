import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodek_app/view/screens/cart.dart';
import 'package:foodek_app/view/screens/favorites.dart';
import 'package:foodek_app/view/screens/history.dart';
import 'package:foodek_app/view/screens/home.dart';
import 'package:foodek_app/view/screens/profile.dart';
import 'package:foodek_app/view/screens/track.dart';
import '../core/util/colors.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  bool _showCart = false;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    HistoryScreen(),
    // TrackScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showCart = false;
    });
  }

  void _toggleCart() {
    setState(() {
      _showCart = !_showCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showCart ? CartScreen() : _screens[_selectedIndex],
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: AppColors.light_green,
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: _showCart ? Colors.green[800] : Colors.green,
          onPressed: _toggleCart,
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 82,
        color: Colors.green[100],
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Left side items
              Row(
                children: [
                  _buildNavItem(Icons.home, tr("home"), 0),
                  SizedBox(width: 32),
                  _buildNavItem(Icons.favorite_border, tr("favorites"), 1),
                ],
              ),
              // Right side items
              Row(
                children: [
                  _buildNavItem(Icons.history, tr("history"), 2),
                  SizedBox(width: 32),
                  _buildNavItem(Icons.person, tr("profile"), 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return IconButton(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                (_selectedIndex == index && !_showCart)
                    ? Colors.green
                    : Colors.black54,
          ),
          Text(
            label,
            style: TextStyle(
              color:
                  (_selectedIndex == index && !_showCart)
                      ? Colors.green
                      : Colors.black54,
              fontSize: 11,
            ),
          ),
        ],
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
