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
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_02.jpg',
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
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_03.jpg',
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
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_04.jpg',
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
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_05.jpg',
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
      id: 1,
      name: 'Abstract Paintings',
      img: 'assets/images/product_06.jpg',
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
  ];
}
