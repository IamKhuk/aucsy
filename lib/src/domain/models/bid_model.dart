class BidModel {
  int bidId;
  String bidderUsername;
  String bidderAvatar;
  double price;
  DateTime time;

  BidModel({
    required this.bidId,
    required this.bidderUsername,
    required this.bidderAvatar,
    required this.price,
    required this.time,
  });
}
