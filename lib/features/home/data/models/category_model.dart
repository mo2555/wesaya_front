
class CategoryModel {
  final int id;
  final String name;
  final bool isActive;

  CategoryModel({
    required this.name,
    required this.id,
    required this.isActive,
  });

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isActive': isActive,
    };
  }
}
