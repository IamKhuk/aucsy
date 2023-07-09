import 'package:aucsy/src/domain/models/product_model.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:aucsy/src/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class ExploreProductContainer extends StatefulWidget {
  const ExploreProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ExploreProductContainer> createState() =>
      _ExploreProductContainerState();
}

class _ExploreProductContainerState extends State<ExploreProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppTheme.dark,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width-48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Hero(
                tag: widget.product,
                child: Image.asset(
                  widget.product.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(width: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: AppTheme.fontFamily,
                    color: AppTheme.white,
                    letterSpacing: 0.48,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width - 80,
            color: AppTheme.gray.withOpacity(0.2),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 16),
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
                        height: 20,
                        width: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            widget.product.creator.avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return Constants.usernameGradient
                              .createShader(bounds);
                        },
                        child: Text(
                          "@${widget.product.creator.username}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.normal,
                            color: AppTheme
                                .white, // Set an initial color for the text
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
