class CategoryModel {
  final String catName;
  final String parentID;

  CategoryModel({
    required this.catName,
    required this.parentID,
  });

   static CategoryModel fromJson(Map<String, dynamic> json, String id) => CategoryModel(
        catName: json['catName'] as String? ?? '',
        parentID: json['parentID'] as String? ?? ''
      );
}
