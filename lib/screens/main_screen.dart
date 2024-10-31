import 'package:flutter/material.dart';
import 'package:food/screens/account_screen.dart';
import 'package:food/screens/dashboard.dart';
import 'package:food/screens/orders.dart';
import 'package:food/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_4_outlined),
            label: 'Acount',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Dashboard(),
        SearchScreen(),
        Orders(),
        AccountScreen()

        /// Notifications page
      ][currentPageIndex],
    );
  }
}
