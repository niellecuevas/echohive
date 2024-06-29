import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: List.generate(artists.length, (index) {
          final artist = artists[index];
          final imageUrl = artist['image']!;

          // Define the staggered tile size
          final isEven = index % 2 == 0;
          final crossAxisCellCount = 2;
          final mainAxisCellCount = isEven ? 2 : 3;

          return StaggeredGridTile.count(
            crossAxisCellCount: crossAxisCellCount,
            mainAxisCellCount: mainAxisCellCount,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  artist['name']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
