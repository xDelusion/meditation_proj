import 'package:explained_full/app/pages/exercise/models/exercises.dart';
import 'package:explained_full/app/pages/exercise/services/exercise_service.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';

class ExerciseProvider extends ChangeNotifier {
  List<ExerciseData> exerciseList = [];
  final ExerciseService _exerciseService = ExerciseService();

  Future<List<ExerciseData>> gettingExercises() async {
    try {
      exerciseList = await _exerciseService.getExercises();
      notifyListeners();
      printSuccess("[ Exercises ] fetched successfully");
      return exerciseList;
    } catch (error) {
      printError("Error fetching [ Exercises ]: $error");
      throw error.toString();
    }
  }
}
