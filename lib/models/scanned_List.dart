class ScannedList {
  final String schoolName;
  final String grade;
  final List<String> scannedItems;
  late String id = '';

  ScannedList({
    required this.scannedItems,
    required this.schoolName,
    required this.grade,
    id,
  });

  static ScannedList fromJson(Map<String, dynamic> json, String _id) {
    var firebaseData = [];
    firebaseData = json['scannedItems'] ?? [];
    List<String> productNames = [];
    for (var id in firebaseData)
      productNames.add(
        id.toString().trim(),
      );

    return ScannedList(
      scannedItems: productNames,
      schoolName: json['school_name'],
      grade: json['grade'],
      id: _id,
    );
  }

  toJson() {
    return {
      'grade': grade,
      'scannedItems': scannedItems,
      'school_name': schoolName,
    };
  }
}
