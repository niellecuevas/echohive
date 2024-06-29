import 'package:flutter/material.dart';
import 'song_data.dart'; // Import the song data
import 'music_player_screen.dart';

class ArtistSongsScreen extends StatelessWidget {
  final String artistName;

  ArtistSongsScreen({required this.artistName});

  @override
  Widget build(BuildContext context) {
    final artistSongs =
        songs.where((song) => song['artist'] == artistName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$artistName Songs'),
        backgroundColor: Color(0xFFFBC02D), // Yellow
      ),
      body: ListView.builder(
        itemCount: artistSongs.length,
        itemBuilder: (context, index) {
          final song = artistSongs[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.music_note, color: Colors.white),
            ),
            title: Text(song['name'] ?? ''),
            subtitle: Text(
              '${song['album']} • ${song['duration']}',
              style: TextStyle(color: Color(0xFF8B4513)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerScreen(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
