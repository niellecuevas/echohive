import 'package:flutter/material.dart';
import 'artist_song_screen.dart';

class ArtistScreen extends StatelessWidget {
  final List<Map<String, String>> artists = [
    {'name': 'Blackpink', 'image': 'assets/appimages/blackpenk.jpg'},
    {'name': 'Hozier', 'image': 'assets/appimages/hoze.jpg'},
    {'name': 'System of a Down', 'image': 'assets/appimages/SOAD.jpg'},
    {'name': 'Hatsune Miku', 'image': 'assets/appimages/mikuhd.jpg'},
    {'name': 'Adam Lambert', 'image': 'assets/appimages/adam lambert.jpg'},
    {'name': 'Avril Lavigne', 'image': 'assets/appimages/avril.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistSongScreen(
                    artistName: artist['name']!,
                    artistImage: artist['image']!,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    artist['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color:
                        Colors.black.withOpacity(0.5), // Dark gradient effect
                    child: Text(
                      artist['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
