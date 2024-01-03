import 'package:explained_full/app/pages/meditation/models/meditation.dart';
import 'package:explained_full/app/pages/meditation/services/mediation_service.dart';
import 'package:flutter/material.dart';

class MeditationProvider extends ChangeNotifier {
  List<Meditation> meditationList = [];

  final MeditationService _meditationService = MeditationService();

  Future<List<Meditation>> gettingMeditation() async {
    try {
      meditationList = await _meditationService.gettingMeditation();
      notifyListeners();
      return meditationList;
    } catch (e) {
      throw e.toString();
    }
  }
}
