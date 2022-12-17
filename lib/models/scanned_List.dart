class ScannedList {
  final String id;
  final String schoolName;
  final String grade;
  final List<String> scannedItems;

  ScannedList({
    required this.scannedItems,
    required this.schoolName,
    required this.grade,
    required this.id,
  });

  static ScannedList fromJson(Map<String, dynamic> json, String id) {
    var firebaseData = [];
    firebaseData = json['scannedItems'] ?? [];
    List<String> productNames = [];
    for (var id in firebaseData)
      productNames.add(
        id.toString().trim(),
      );

    return ScannedList(
      id: id,
      scannedItems: productNames,
      schoolName: json['school_name'],
      grade: json['grade'],
    );
  }
}
