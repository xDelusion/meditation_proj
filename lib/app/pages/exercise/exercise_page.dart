import 'package:explained_full/app/pages/exercise/components/exercise_future_builder.dart';
import 'package:explained_full/app/shared/background_gradient.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: ExerciseFutureBuilder(),
    ));
  }
}
