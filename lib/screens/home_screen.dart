import 'package:flutter/material.dart';
import 'package:sopo/screens/contact_screen.dart';
import 'package:sopo/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
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
            selectedIcon: Icon(Icons.contacts),
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.post_add_rounded)),
            label: 'Post',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.groups),
            icon: Icon(Icons.groups),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        // ListView.separated(
        //   padding: const EdgeInsets.all(8),
        //   itemCount: entries.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 50,
        //       color: Colors.amber[colorCodes[index]],
        //       child: Center(child: Text('Entry ${entries[index]}')),
        //     );
        //   },
        //   separatorBuilder: (BuildContext context, int index) =>
        //       const Divider(),
        // ),

        /// Notifications page
        const ContactScreen(),
        const ContactScreen(),
        const ProfileScreen(),

        /// Messages page
      ][currentPageIndex],
    );
  }
}
