class ParentProfile {
  final String id;
   String email;
  String name;
  String phone;
  List<String> products;
  List<String> orderSeller;


  ParentProfile({
    required this.id,
    required this.email,
    this.phone="",
    this.name = '',
    this.orderSeller = const [""],
    this.products = const [""],
  });
}