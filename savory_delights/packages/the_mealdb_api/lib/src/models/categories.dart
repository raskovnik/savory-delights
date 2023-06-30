import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'strCategory')
  final String name;
  @JsonKey(name: 'strCategoryThumb')
  final String imageURL;
  
  Category({
    required this.name,
    required this.imageURL,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
