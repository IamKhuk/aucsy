import 'package:aucsy/src/domain/models/product_model.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class ActiveProductContainer extends StatefulWidget {
  const ActiveProductContainer({Key? key, required this.product,})
      : super(key: key);

  final ProductModel product;

  @override
  State<ActiveProductContainer> createState() => _ActiveProductContainerState();
}

class _ActiveProductContainerState extends State<ActiveProductContainer> {

  LinearGradient usernameGradient = const LinearGradient(
    colors: [Color(0xFFBAC1FF), Color(0xFF63FEFE), Color(0xFFFF3EEC),],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      width: 256,
      padding: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.dark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 125,
            width: 256,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: widget.product,
                child: Image.asset(
                  widget.product.img,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: AppTheme.fontFamily,
                      color: AppTheme.white,
                      letterSpacing: 1.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: 232,
                    color: AppTheme.gray.withOpacity(0.2),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 232,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Creator',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppTheme.gray,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      widget.product.creator.avatar,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                ShaderMask(
                                  shaderCallback: (bounds) {
                                    return usernameGradient.createShader(bounds);
                                  },
                                  child: Text(
                                    "@${widget.product.creator.username}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.fontFamily,
                                      fontWeight: FontWeight.normal,
                                      color: AppTheme.white, // Set an initial color for the text
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                fontWeight: FontWeight.bold,
                                color: AppTheme.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 12),
            ],
          )
        ],
      ),
    );
  }
}

