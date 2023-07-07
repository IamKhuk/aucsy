import 'package:aucsy/src/domain/models/bid_model.dart';
import 'package:aucsy/src/utils/constants/constants.dart';
import 'package:aucsy/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class BidContainer extends StatelessWidget {
  const BidContainer({
    Key? key,
    required this.bid,
  }) : super(key: key);
  final BidModel bid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 28,
            width: 28,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: CachedNetworkImage(
                imageUrl: bid.bidderAvatar,
                placeholder: (context, url) => Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: AppTheme.dark,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: AppTheme.dark,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.error_outline_outlined,
                      color: AppTheme.red,
                    ),
                  ),
                ),
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Bid placed by ",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.white,
                        letterSpacing: 0.2,
                        height: 1.5,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return Constants.usernameGradient.createShader(bounds);
                      },
                      child: Text(
                        bid.bidderUsername,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.fontFamily,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  Utils.bidTimeFormat(bid.time),
                  style: const TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppTheme.gray,
                    letterSpacing: 0.2,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${bid.price} USD",
            style: const TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.white,
              letterSpacing: 0.2,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
