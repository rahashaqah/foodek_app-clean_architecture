import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import 'custom_text.dart';

class QuantityWidget extends StatefulWidget {
  final double squareSize;
  final double squareRadius;
  final double textSize;
  final double fullWidth;
  final Color? subtractColor;
  const QuantityWidget({
    super.key,
    this.squareSize = 32,
    this.textSize = 20,
    this.fullWidth = 150,
    this.squareRadius = 12,
    this.subtractColor,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int _quantity = 1;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: responsiveWidth(context, widget.fullWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 20),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _decreaseQuantity,
                  child: Container(
                    height: responsiveHeight(context, widget.squareSize),
                    width: responsiveWidth(context, widget.squareSize),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.squareRadius),
                      border: Border.all(
                        color:
                            widget.subtractColor != null
                                ? AppColors.light_green
                                : AppColors.mid_green,
                      ),
                      color: widget.subtractColor ?? AppColors.mid_green,
                    ),
                    child: Icon(Icons.remove, color: AppColors.mid_green),
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "$_quantity",
                  weight: FontWeight.w500,
                  size: widget.textSize,
                ),
                Spacer(),
                GestureDetector(
                  onTap: _increaseQuantity,
                  child: Container(
                    height: responsiveHeight(context, widget.squareSize),
                    width: responsiveWidth(context, widget.squareSize),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.squareRadius),
                      color: AppColors.mid_green,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
