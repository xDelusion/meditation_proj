import 'package:explained_full/app/pages/music/models/music.dart';
import 'package:explained_full/app/pages/music/providers/music_provider.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicListView extends StatelessWidget {
  MusicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: context.watch<MusicProvider>().musicList.length,
          itemBuilder: (context, index) {
            Music currentMusic =
                context.watch<MusicProvider>().musicList[index];

            return Card(
              child: ListTile(
                title: Text(currentMusic.title),
                subtitle: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        // try {
                        //   // Create an AudioPlayer instance
                        //   AudioPlayer audioPlayer = AudioPlayer();

                        //   // Play the audio file using the provided URL
                        //   audioPlayer.play(UrlSource(currentMusic.file));
                        // } catch (e) {
                        //   print('Error during audio playback: $e');
                        // }
                      },
                      icon: Icon(Icons.play_arrow),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.pause))
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    bool addedToFavorites =
                        context.read<MusicProvider>().addToFavorites(
                              currentMusic.id,
                            );

                    final snackBar = SnackBar(
                      content: Text(addedToFavorites
                          ? 'Track ${currentMusic.id} added to Favorites Successfully!!'
                          : 'Something went wrong!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    addedToFavorites
                        ? printSuccess(
                            'Track ${currentMusic.id} added to Favorites Successfully!!')
                        : printError('Something went wrong!');
                  },
                  icon: Icon(Icons.favorite),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
