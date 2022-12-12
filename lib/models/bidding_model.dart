class BiddingModel {
  final String buyerID;
  final String productID;
  final String buyerName;
  final int bid;
  final String id;

  BiddingModel(
      {required this.productID,
      required this.buyerName,
      required this.buyerID,
      required this.bid,
      required this.id});

  static BiddingModel fromJson(Map<String, dynamic> json, String id) =>
      BiddingModel(
        buyerName: json['buyerName'] as String? ?? '',
          productID: json['productID'] as String? ?? '',
          buyerID: json['buyerID'] as String? ?? '',
          bid: json['bid'] as int? ?? 0,
          id: id);
  toJson() {
    return {
      'productID': productID,
      'buyerID': buyerID,
      'bid': bid,
      "byerName":buyerName
    };
  }
}
