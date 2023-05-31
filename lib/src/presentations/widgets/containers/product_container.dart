import 'package:aucsy/src/domain/models/product_model.dart';
import 'package:aucsy/src/presentations/widgets/containers/due_time_container.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236,
      width: 156,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.dark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 136,
            width: 140,
            child: Stack(
              children: [
                SizedBox(
                  height: 136,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Hero(
                      tag: widget.product,
                      child: Image.asset(
                        widget.product.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                widget.product.time.isAfter(DateTime.now())
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.dark.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: DueTimeText(
                              endTime: widget.product.time,
                              onTimeChanged: (time) {},
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: AppTheme.fontFamily,
              color: AppTheme.white,
              letterSpacing: 0.2,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  const Text(
                    'Current bid',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.gray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.product.currentBid.price} USD',
                    style: const TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 6, top: 6, bottom: 4, right: 4),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: AppTheme.blue.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/right.svg',
                    color: AppTheme.white,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
