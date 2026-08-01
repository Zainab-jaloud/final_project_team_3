
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/booking_activity/presentation/widget/status_widget.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_svg/svg.dart';

class CancelledWidget extends StatelessWidget {
  const CancelledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertyStatus(properties:properties[0],status:'Cancelled', date:'08 Aug - 12 Aug'),
          InkWell(
    onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
           vertical:8,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/call.svg'),    
            const SizedBox(width: 16),
            Text(
              'Call Agent',
              style: AppTextStyle.optionLabelStyle,
            ),
          ],
        ),
      ),
      ),Divider(color: AppColors.borderColor,thickness:0.5,),  ],
    );
  }
}
