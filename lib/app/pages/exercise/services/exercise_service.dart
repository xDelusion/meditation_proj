import 'package:explained_full/app/pages/exercise/models/exercises.dart';
import 'package:explained_full/app/shared/api/api_client.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';

class ExerciseService {
  Future<List<ExerciseData>> getExercises() async {
    try {
      final responseValue = await Client.get("/exercises");
      if (responseValue.statusCode == 200) {
        final List<ExerciseData> exerciseList = List.from(responseValue.data)
            .map((e) => ExerciseData.fromJson(e))
            .toList();
        return exerciseList;
      } else {
        printInfo("responseValue.statusCode: ${responseValue.statusCode}");
        printInfo("responseValue.data: ${responseValue.data}");
      }
    } catch (error) {
      printError("[ ExerciseService ] fetching ERROR: $error");
      throw error.toString();
    }
    return [];
  }
}
