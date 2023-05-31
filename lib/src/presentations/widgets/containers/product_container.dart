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
      height: 224,
      width: 144,
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
            width: 128,
            child: Stack(
              children: [
                SizedBox(
                  height: 136,
                  width: 128,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      widget.product.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widget.product.time.isAfter(DateTime.now())
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                DueTimeContainer(endTime: widget.product.time),
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
                padding: const EdgeInsets.only(left: 6, top: 6, bottom: 4, right: 4),
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: AppTheme.blue,
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
