class BiddingModel{
  final String buyerID;
  final int bid;
  final String id;
  

  BiddingModel({
    required this.buyerID,
    required  this.bid,
    required this.id
  });

  static BiddingModel fromJson(Map<String, dynamic> json, String id) =>
    BiddingModel(
      buyerID: json['buyerID']as String? ?? '',
      bid: json['Bid'] as int? ?? 0,
      id:id
         );
  }
