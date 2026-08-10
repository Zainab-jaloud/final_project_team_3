import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
class PriceRangeSlider extends StatefulWidget {
  final RangeValues initialValues;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  const PriceRangeSlider({
    super.key,
    required this.initialValues,
    required this.onChanged,
    this.min = 0,
    this.max = 1000,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _currentPriceRange;

  @override
  void initState() {
    super.initState();
   
    _currentPriceRange = widget.initialValues;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(
          thickness: 2,
          color: Color(0xffD2D6DB),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 0.5,
            overlayShape: SliderComponentShape.noOverlay,
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 6.0,
              elevation: 2.0,
            ),
            activeTrackColor: AppColors.secondaryColor,
            inactiveTrackColor: Colors.transparent,
            thumbColor: AppColors.secondaryColor, 
          ),
          child: RangeSlider(
            values: _currentPriceRange,
            min: widget.min,
            max: widget.max,
            labels: RangeLabels(
              '\$${_currentPriceRange.start.round()}',
              '\$${_currentPriceRange.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentPriceRange = values;
              });
              // ارسال القيم الجديدة للصفحة
              widget.onChanged(values);
            },
          ),
        ),
      ],
    );
  }
}
