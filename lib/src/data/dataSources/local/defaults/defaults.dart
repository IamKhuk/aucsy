import 'package:aucsy/src/domain/models/bid_model.dart';
import 'package:aucsy/src/domain/models/creator_model.dart';

import '../../../../domain/models/product_model.dart';

class Defaults {
  List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_01.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0001,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 120,
        time: DateTime.now(),
      ),
      time: DateTime.now(),
      status: 1,
      bidMargin: 10,
    ),
    ProductModel(
      id: 2,
      name: 'It\'s Art',
      img: 'assets/images/product_02.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0002,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 235,
        time: DateTime.now(),
      ),
      time: DateTime.now(),
      status: 1,
      bidMargin: 5,
    ),
    ProductModel(
      id: 3,
      name: 'Colour of Art',
      img: 'assets/images/product_03.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0003,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 90,
        time: DateTime.now(),
      ),
      time: DateTime.now(),
      status: 1,
      bidMargin: 10,
    ),
    ProductModel(
      id: 4,
      name: 'Abstract Paintings',
      img: 'assets/images/product_04.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0004,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 950,
        time: DateTime.now(),
      ),
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour + 4,
      ),
      status: 1,
      bidMargin: 25,
    ),
    ProductModel(
      id: 5,
      name: 'Abstract Paintings',
      img: 'assets/images/product_05.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0005,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 520,
        time: DateTime.now(),
      ),
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour + 5,
      ),
      status: 1,
      bidMargin: 20,
    ),
    ProductModel(
      id: 6,
      name: 'Abstract Paintings',
      img: 'assets/images/product_06.jpg',
      text:
          'Unlockable content contain link to download the original file and NFT License.',
      creator: CreatorModel(id: 001, username: 'iamkhuk', avatar: "avatar"),
      currentBid: BidModel(
        bidId: 0006,
        bidderUsername: 'bidderUsername',
        bidderAvatar: "bidderAvatar",
        price: 120,
        time: DateTime.now(),
      ),
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour + 3,
      ),
      status: 1,
      bidMargin: 10,
    ),
  ];

  List<BidModel> bids = [
    BidModel(
      bidId: 0005,
      bidderUsername: 'bidderUsername',
      bidderAvatar: "bidderAvatar",
      price: 520,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'two',
      bidderAvatar: "two",
      price: 500,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'three',
      bidderAvatar: "three",
      price: 480,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'four',
      bidderAvatar: "four",
      price: 460,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'five',
      bidderAvatar: "five",
      price: 440,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'sixsix',
      bidderAvatar: "three",
      price: 420,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'seven',
      bidderAvatar: "three",
      price: 300,
      time: DateTime.now(),
    ),
    BidModel(
      bidId: 0005,
      bidderUsername: 'eighty',
      bidderAvatar: "three",
      price: 120,
      time: DateTime.now(),
    ),
  ];

  List<String> ctg = [
    "All",
    "Trending",
    "Live Auctions",
    "Top",
    "Creative",
  ];
}
