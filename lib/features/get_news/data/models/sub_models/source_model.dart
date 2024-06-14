import 'package:news_app_with_clean_architecture/core/databases/api/end_points.dart';
import '../../../domain/entities/sub_entities/source_entity.dart';

class SourceModel extends SourceEntity{
  SourceModel({
    required super.id,
    required super.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
    };
  }
}