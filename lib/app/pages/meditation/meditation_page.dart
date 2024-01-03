import 'package:explained_full/app/pages/meditation/components/meditation_future_builder.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Meditation'),
            ),
            body: MeditationFutureBuilder()));
  }
}
