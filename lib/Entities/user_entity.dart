// User Profile for UI
class StudentUserProfile {
  final String id;
  final String email;
  String name;
  String phone;
  String schoolName;
  String grade;
  String display;
  String dob;
  String rating;
  List<String> productIDs;
  List<String> orderBuyerIDs;
  List<String> orderSellerIDs;
  List<String> wishListIDs;

  StudentUserProfile({
    required this.id,
    required this.email,
    this.name = '',
    this.rating = '',
    this.phone = '',
    this.schoolName = '',
    this.grade = '',
    this.dob = '',
    this.display = 'https://img.icons8.com/bubbles/50/000000/user.png',
    this.orderBuyerIDs = const [""],
    this.orderSellerIDs = const [""],
    this.wishListIDs = const [""],
    this.productIDs = const [""],
  });
}
