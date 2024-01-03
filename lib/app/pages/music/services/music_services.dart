import 'package:explained_full/app/pages/music/models/music.dart';
import 'package:explained_full/app/shared/api/api_client.dart';

class MusicService {
  Future<List<Music>> getMusic() async {
    try {
      final responseValue = await Client.get("/music");
      if (responseValue.statusCode == 200) {
        final List<Music> listOfMusic = List.from(responseValue.data)
            .map((e) => Music.fromJson(e))
            .toList();
        return listOfMusic;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
