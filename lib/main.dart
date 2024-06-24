import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for Random class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Builder Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Home(),
      routes: {
        '/musicPlayer': (context) => const MusicPlayerScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // Dummy list of music tracks
  final List<String> musicTracks = const [
    'Bang Bang - Ariana Grande',
    'Crazier - Taylor Swift',
    'Salamin - BINI',
    'Pantropiko - BINI',
    'Gento - SB19',
  ];

  // Method to handle selecting a random song and navigating to MusicPlayerScreen
  void playRandomSong(BuildContext context) {
    // Generate a random index within the range of musicTracks
    final Random random = Random();
    int randomNumber = random.nextInt(musicTracks.length);

    // Navigate to MusicPlayerScreen with the selected song
    Navigator.pushNamed(
      context,
      '/musicPlayer',
      arguments: MusicPlayerArguments(
        musicTracks[randomNumber], // Pass track name
        'https://example.com/album.jpg', // Replace with actual album image URL if available
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EchoHive',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5E1675), // Purple color for app bar
      ),
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFD23F), // Yellow color for drawer header
              ),
              child: Text(
                'EchoHive',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Music Playlist'),
              leading: const Icon(Icons.library_music),
              onTap: () {
                // Logic for Music Playlist
                Navigator.pop(context); // Close the drawer
                // Implement navigation or logic for Music Playlist
              },
            ),
            ListTile(
              title: const Text('Album Category'),
              leading: const Icon(Icons.album),
              onTap: () {
                // Logic for Album Category
                Navigator.pop(context); // Close the drawer
                // Implement navigation or logic for Album Category
              },
            ),
            const Divider(), // Divider for visual separation
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Logic for Settings
                Navigator.pop(context); // Close the drawer
                // Implement navigation or logic for Settings
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: musicTracks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text(musicTracks[index]),
            subtitle: const Text('Album name, Duration: 3:30'),
            onTap: () {
              // Navigate to MusicPlayerScreen and pass necessary data
              Navigator.pushNamed(
                context,
                '/musicPlayer',
                arguments: MusicPlayerArguments(
                  musicTracks[index], // Example: Pass track name
                  'https://example.com/album.jpg', // Replace with actual album image URL if available
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the method to play a random song
          playRandomSong(context);
        },
        child: const Icon(Icons.play_arrow),
        backgroundColor: const Color(0xFFFFD23F), // Yellow color for FAB
      ),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerArguments args =
        ModalRoute.of(context)!.settings.arguments as MusicPlayerArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: const Color(0xFF5E1675), // Purple color for app bar
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Album Artwork (replace with Image.network for actual image)
            Container(
              width: 200,
              height: 200,
              color: Colors.grey, // Placeholder color
              child: const Center(
                child: Text('Album Artwork'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              args.trackName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {
                    // Logic for previous track
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    // Logic for play/pause
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {
                    // Logic for next track
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MusicPlayerArguments {
  final String trackName;
  final String albumImageUrl;

  MusicPlayerArguments(this.trackName, this.albumImageUrl);
}
