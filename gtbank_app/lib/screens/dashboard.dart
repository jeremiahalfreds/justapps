import 'package:flutter/material.dart';
import 'dart:ui';

// Home page
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> animeList = [
    {'title': 'Demon Slayer', 'image': 'images/j3.jpg'},
    {'title': 'Attack on Titan', 'image': 'images/j5.png'},
    {'title': 'Naruto', 'image': 'images/j4.avif'},
    {'title': 'One Piece', 'image': 'images/j6.jpg'},
    {'title': 'Jujutsu Kaisen', 'image': 'images/j2.jpg'},
    {'title': 'Bleach', 'image': 'images/j1.avif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: animeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // width/height ratio
        ),
        itemBuilder: (context, index) {
          final anime = animeList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Image.asset(anime['image']!, fit: BoxFit.cover),
      
                // Blur overlay at bottom
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          height: 50,
                          color: Colors.black.withOpacity(0.4),
                          alignment: Alignment.center,
                          child: Text(
                            anime['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
