import 'package:explained_full/app/pages/music/components/music_future_builder.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Music'),
            ),
            body: MusicFutureBuilder()));
  }
}
