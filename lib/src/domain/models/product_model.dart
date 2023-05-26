import 'package:aucsy/src/domain/models/bid_model.dart';
import 'package:aucsy/src/domain/models/creator_model.dart';

class ProductModel {
  int id;
  String name;
  String img;
  String text;
  CreatorModel creator;
  BidModel currentBid;
  DateTime time;
  int status; // 1=ongoing, -1=finished, 2=upcoming
  double bidMargin;

  ProductModel({
    required this.id,
    required this.name,
    required this.img,
    required this.text,
    required this.creator,
    required this.currentBid,
    required this.time,
    required this.status,
    required this.bidMargin,
  });
}
