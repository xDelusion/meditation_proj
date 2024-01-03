import 'package:explained_full/app/pages/music/models/music.dart';
import 'package:explained_full/app/pages/music/providers/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesListView extends StatelessWidget {
  FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Consumer<MusicProvider>(
        builder: (context, musicProvider, child) {
          List<Music> favoritesList = musicProvider.favoritesList;

          if (favoritesList.isEmpty) {
            return Center(
              child: Text('No favorites yet.'),
            );
          }

          return Container(
            width: 500,
            child: ListView.builder(
              itemCount: favoritesList.length,
              itemBuilder: (context, index) {
                Music currentMusic = favoritesList[index];

                return Card(
                  color: Colors.blue.shade100,
                  child: ListTile(
                    title: Text(currentMusic.title),
                    subtitle: Text(
                      currentMusic.file.toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
