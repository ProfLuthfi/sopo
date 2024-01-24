import 'package:flutter/material.dart';
import 'package:sopo/screens/contact_screen.dart';
import 'package:sopo/screens/dasboard_screen.dart';

import 'package:sopo/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard),
            label: 'Dasboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const DashboardScreen(),

        /// Notifications page
        const ContactScreen(),

        /// Profil page
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
