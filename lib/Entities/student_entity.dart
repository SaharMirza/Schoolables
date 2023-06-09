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
  List<String> products;
  List<String> orderBuyer;
  List<String> orderSeller;
  List<String> wishListIDs;
  List<String> biddingIDs;
  List<String> sellingbiddingIDs;

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
    this.orderBuyer = const [""],
    this.orderSeller = const [""],
    this.wishListIDs = const [""],
    this.products = const [""],
    this.biddingIDs =const[""],
    this.sellingbiddingIDs =const[""],
  });
}