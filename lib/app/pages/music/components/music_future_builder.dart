import 'package:explained_full/app/pages/music/components/music_listview.dart';
import 'package:explained_full/app/pages/music/providers/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicFutureBuilder extends StatelessWidget {
  MusicFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<MusicProvider>().gettingMusic(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('Error loading exercises + $snapshot'),
            );
          }

          return MusicListView();
        });
  }
}
