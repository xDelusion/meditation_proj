import 'package:explained_full/app/pages/tips/models/tips.dart';
import 'package:explained_full/app/pages/tips/service/tips_service.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';

class TipsProvider extends ChangeNotifier {
  List<TipsData> _tipsList = [];
  List<TipsData> _filteredTips = [];

  final TipsService _tipsService = TipsService();

  List<TipsData> get tipsData => _tipsList;
  List<TipsData> get filteredTips => _filteredTips;

  Future<List<TipsData>> getTips() async {
    try {
      _tipsList = await _tipsService.getTips();
      _filteredTips = _tipsList; // Initialize filtered tips with all tips
      notifyListeners();
      printSuccess("Tips fetched successfully");
      return _tipsList;
    } catch (error) {
      printError("Error fetching tips: $error");
      throw error.toString();
    }
  }

  bool _sortOrderAscending = true;

  void toggleSortOrder() {
    _sortOrderAscending = !_sortOrderAscending;
    if (_sortOrderAscending) {
      sortOldToNew();
    } else {
      sortNewToOld();
    }
  }

  void sortOldToNew() {
    _tipsList.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  void sortNewToOld() {
    _tipsList.sort((a, b) => b.id.compareTo(a.id));
    notifyListeners();
  }

  void filterTips(String query) {
    _filteredTips = _tipsList
        .where((item) =>
            item.text.toLowerCase().contains(query.toLowerCase()) ||
            item.author.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // void clearFilter() {
  //   _filteredTips = [];
  //   notifyListeners();
  // }

  Future<void> addTip(String text) async {
    try {
      await _tipsService.addTip(text);
      printSuccess("Tip ADDED successfully: $text");

      await getTips();
    } catch (error) {
      printError("Error adding tip: $error");
      throw error.toString();
    }
  }

  Future<void> deleteTip(int id) async {
    printInfo("Deleting tip with ID: $id");

    try {
      await _tipsService.deleteTip(id);
      tipsData.removeWhere((tip) => tip.id == id);

      printSuccess("Tip deleted successfully");
      notifyListeners();
    } catch (error) {
      printError("Error deleting tip: $error");
    }
  }

  bool isEditing = false;

  void editTitle(int id, String newTitle) {
    TipsData editTitle =
        _tipsList.firstWhere((element) => element.id == id); // find matching id
    if (newTitle.isNotEmpty) {
      editTitle.text =
          newTitle; // change title to what was stored in ' newTitle '
    } else {
      editTitle.text = editTitle
          .text; // if ' newTitle/TextField() ' was empty, keep the original title
    }
    isEditing = !isEditing; // 'isEditing' is [false] by default
    notifyListeners();
  }
}
