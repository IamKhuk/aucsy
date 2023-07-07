import 'package:aucsy/src/domain/models/bid_model.dart';
import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class BottomDialog {
  static void showPlaceBid(
    BuildContext context,
    int productId,
    double currentBidPrice,
    double bidMargin,
    Function(bool changed) onChanged,
  ) {
    TextEditingController bidController = TextEditingController();
    bool isChanged = false;
    double currentBid = currentBidPrice;
    showModalBottomSheet(
      barrierColor: AppTheme.black.withOpacity(0.45),
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 242,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                color: AppTheme.black,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.white.withOpacity(0.05),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Place a bid",
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: AppTheme.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppTheme.gray.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(48),
                            border: Border.all(
                              color: AppTheme.white.withOpacity(0.05),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 4,
                            ),
                            child: TextField(
                              enabled: true,
                              controller: bidController,
                              enableSuggestions: true,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: AppTheme.blue,
                              enableInteractiveSelection: true,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                color: AppTheme.white,
                              ),
                              onEditingComplete: (){
                                setState((){
                                  currentBid = double.parse(bidController.text);
                                  isChanged == true;
                                });
                              },
                              onSubmitted: (result){
                                setState((){
                                  currentBid = double.parse(result);
                                  isChanged == true;
                                });
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Place a bid higher than $currentBidPrice',
                                hintStyle: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                  color: AppTheme.gray.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            setState((){
                              currentBid = currentBid + bidMargin;
                              bidController.text = currentBid.toString();
                              isChanged == true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            ),
                          ),
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                '+$bidMargin',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: AppTheme.fontFamily,
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      MainButton(
                        text: "Apply",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
