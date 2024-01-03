import 'package:dio/dio.dart';
import 'package:explained_full/app/pages/tips/models/tips.dart';
import 'package:explained_full/app/shared/api/api_client.dart';

class TipsService {
  Future<List<TipsData>> getTips() async {
    try {
      final Response responseValue = await Client.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<TipsData> tipsList = List.from(responseValue.data)
            .map((element) => TipsData.fromJson(element))
            .toList();
        return tipsList;
      } else {
        // Handle non-200 status code, e.g., show an error message.
        print("responseValue.statusCode: ${responseValue.statusCode}");
      }
    } catch (error) {
      // Handle general errors, e.g., show an error message.
      print("TipService GET Error: $error");
    }
    return [];
  }

  addTip(String text) async {
    try {
      final Response response = await Client.post(
        "/tips",
        data: {"text": text},
      );
      return response.data;
    } catch (error) {
      throw error.toString();
    }
  }

  deleteTip(int id) async {
    try {
      final Response response = await Client.delete(
        "/tips/$id",
      );
      return response.data;
    } catch (error) {
      throw error.toString();
    }
  }
}
