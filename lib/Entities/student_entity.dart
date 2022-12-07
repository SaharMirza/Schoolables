// User Profile for UI
class UserProfile {
  final String id;
   String email;
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


  UserProfile({
    required this.id,
    required this.email,
    this.phone="",
    this.name = '',
    this.schoolName='',
    this.grade='',   
    this.display = 'https://img.icons8.com/bubbles/50/000000/user.png',
    this.dob = '',
    this.rating = '',
    this.orderBuyerIDs = const [""],
    this.orderSellerIDs = const [""],
    this.wishListIDs = const [""],
    this.productIDs = const [""],
  });
}