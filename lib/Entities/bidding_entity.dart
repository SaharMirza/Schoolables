class Bidding {
  Bidding({
    required this.productID,
    required this.buyerName,
    required this.buyerID,
    required this.bid,
    // required this.id,
    required this.isAccepted,
    required this.isRejected,
  });

  final String buyerID;
  final String productID;
  final String buyerName;
  final int bid;
  // final String id;
  final bool isAccepted;
  final bool isRejected;

  late final String id;
}
