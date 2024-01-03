import 'package:explained_full/app/pages/exercise/components/exercise_listview.dart';
import 'package:explained_full/app/pages/exercise/providers/exercise.providers.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseFutureBuilder extends StatelessWidget {
  ExerciseFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<ExerciseProvider>().gettingExercises(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            printError("Error in FutureBuilder: ${snapshot.error}");
            return Center(
              child: Text('Error loading exercises + $snapshot'),
            );
          }

          return ExerciseListView();
        });
  }
}
