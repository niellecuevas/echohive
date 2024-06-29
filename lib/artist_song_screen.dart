import 'package:flutter/material.dart';
import 'dart:ui';
import 'song_data.dart'; // Import the song data

class ArtistSongScreen extends StatelessWidget {
  final String artistName;
  final String artistImage;

  ArtistSongScreen({
    required this.artistName,
    required this.artistImage,
  });

  @override
  Widget build(BuildContext context) {
    // Filter songs by the selected artist
    final List<Map<String, String>> artistSongs = songs
        .where((song) => song['artist'] == artistName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(artistName),
        backgroundColor: Color.fromARGB(255, 251, 192, 45), // Adjust as per your theme
      ),
      body: Stack(
        children: [
          // Blurred background image
          Positioned.fill(
            child: Image.asset(
              artistImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.5), // Dark overlay for readability
              ),
            ),
          ),
          // Display the list of songs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: artistSongs.length,
              itemBuilder: (context, index) {
                final song = artistSongs[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  leading: Image.asset(
                    song['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    song['title']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    song['artist']!,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    // Handle tap on song to play or show details
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
