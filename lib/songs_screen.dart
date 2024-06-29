import 'package:flutter/material.dart';
import 'music_player_screen.dart';

class SongsScreen extends StatelessWidget {
  final List<Map<String, String?>> songs;

  SongsScreen({required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.music_note, color: Colors.white),
            ),
            title: Text(songs[index]['name'] ?? ''),
            subtitle: Text(
              '${songs[index]['artist']} • ${songs[index]['album']}',
              style: TextStyle(color: Color(0xFF8B4513)),
            ),
            trailing: Text(songs[index]['duration'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerScreen(song: songs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
