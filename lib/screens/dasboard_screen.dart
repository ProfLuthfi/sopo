import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        backgroundColor: Colors.black,
      ),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Tapped"),
        child: const Icon(Icons.camera_alt),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10, // Replace with your actual number of posts
      itemBuilder: (BuildContext context, int index) {
        return _buildPostCard(index);
      },
    );
  }

  Widget _buildPostCard(int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPostHeader(),
          _buildPostImage(index),
          _buildPostActions(),
          _buildPostLikes(),
          _buildPostCaption(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blue,
        // Replace with your user's profile image
        backgroundImage: AssetImage('assets/profile_image.jpg'),
      ),
      title: Text('Username'),
      subtitle: Text('Location'),
      trailing: const Icon(Icons.more_vert),
    );
  }

  Widget _buildPostImage(int index) {
    // Replace with your actual image URL
    String imageUrl = 'https://picsum.photos/400?image=$index';

    return Container(
      width: double.infinity, // Full width of the card
      height: 300, // Adjust the height as needed
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => print('Like'),
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () => print('Comment'),
              icon: const Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () => print('Share'),
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.bookmark_border),
        ),
      ],
    );
  }

  Widget _buildPostLikes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '100 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPostCaption() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text('Caption text...'),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DashboardScreen(),
  ));
}
