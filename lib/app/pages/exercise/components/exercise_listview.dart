import 'package:explained_full/app/pages/exercise/models/exercises.dart';
import 'package:explained_full/app/pages/exercise/providers/exercise.providers.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseListView extends StatelessWidget {
  ExerciseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(
      builder: (context, value, child) {
        try {
          return ListView.builder(
            itemCount: context.watch<ExerciseProvider>().exerciseList.length,
            itemBuilder: (context, index) {
              ExerciseData currentExercise =
                  context.watch<ExerciseProvider>().exerciseList[index];

              return Card(
                child: ListTile(
                  title: Text(currentExercise.title),
                  subtitle: Text(currentExercise.finished.toString()),
                ),
              );
            },
          );
        } catch (error) {
          printError("Error in Consumer of [ ExerciseListView ]: $error");
          // You can also log or print more specific details about the error if needed
          return Center(
            child: Text('Error displaying exercises: $error'),
          );
        }
      },
    );
  }
}
