import 'package:notices_app/domain/entities/news_source.dart';

class SourceModel extends Source {
  const SourceModel({required super.id, required super.name});

  static List<SourceModel> fromJsonList(List<dynamic> list) {
    return list.map((json) => SourceModel.fromJson(json)).toList();
  }

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
