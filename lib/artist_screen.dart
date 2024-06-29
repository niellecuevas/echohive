import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui'; // For ImageFilter
import 'artist_song_screen.dart'; // Ensure this file exists and is correctly imported

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
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0, // Max width of each item
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2 / 3, // Aspect ratio for tiles
        ),
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistSongsScreen(artistName: artist['name']!),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(artist['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}