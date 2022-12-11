class ParentProfile {
  final String id;
   String email;
  String name;
  String phone;
  List<String> productIDs;
  List<String> orderSellerIDs;


  ParentProfile({
    required this.id,
    required this.email,
    this.phone="",
    this.name = '',
    this.orderSellerIDs = const [""],
    this.productIDs = const [""],
  });
}