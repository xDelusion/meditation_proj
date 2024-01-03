import 'package:explained_full/app/pages/meditation/models/meditation.dart';
import 'package:explained_full/app/shared/api/api_client.dart';

class MeditationService {
  Future<List<Meditation>> gettingMeditation() async {
    try {
      final responseValue = await Client.get("/meditation");
      if (responseValue.statusCode == 200) {
        final List<Meditation> listOfMeditation = List.from(responseValue.data)
            .map((e) => Meditation.fromJson(e))
            .toList();
        return listOfMeditation;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
