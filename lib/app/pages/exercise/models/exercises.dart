class ExerciseModel {
  ExerciseModel({
    required this.dataEx,
  });
  late final List<ExerciseData> dataEx;

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    dataEx =
        List.from(json['dataEx']).map((e) => ExerciseData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dataEx'] = dataEx.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ExerciseData {
  ExerciseData({
    required this.id,
    required this.title,
    required this.file,
    required this.finished,
  });
  late final int id;
  late final String title;
  late final String file;
  late final bool finished;

  ExerciseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
    finished = json['finished'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['file'] = file;
    _data['finished'] = finished;
    return _data;
  }
}
