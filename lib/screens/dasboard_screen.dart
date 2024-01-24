import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> usernames = <String>[
    'UserA',
    'UserB',
    'UserC',
    'UserD',
    'UserE'
  ];
  final List<String> posts = <String>[
    'Post A content here.',
    'Post B content here.',
    'Post C content here.',
    'Post D content here.',
    'Post E content here.',
  ];
  final List<int> images = <int>[1, 2, 3, 4, 5];

  // Sets to track liked, commented, and shared items
  Set<int> likedItems = {};
  Set<int> commentedItems = {};
  Set<int> sharedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Post'),
      ),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("tap"),
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: usernames.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/250?image=${images[index]}'),
                    ),
                    SizedBox(width: 16),
                    Text(
                      usernames[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  posts[index],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Image.network(
                  'https://picsum.photos/400?image=${images[index]}',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                        Icons.thumb_up, 'Like', index, likedItems),
                    _buildActionButton(
                        Icons.comment, 'Comment', index, commentedItems),
                    _buildActionButton(
                        Icons.share, 'Share', index, sharedItems),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 16),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, String label, int index, Set<int> itemsSet) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (itemsSet.contains(index)) {
            itemsSet.remove(index);
          } else {
            itemsSet.add(index);
          }
        });
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: itemsSet.contains(index) ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: itemsSet.contains(index) ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
