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
      time: DateTime.now(),
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
      time: DateTime.now(),
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
      time: DateTime.now(),
      status: 1,
      bidMargin: 10,
    ),
  ];
}
