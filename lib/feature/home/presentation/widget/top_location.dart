import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
 
// ignore: must_be_immutable
class TopLocation extends StatelessWidget {
   const TopLocation({
    super.key, required this.address,    required this.isSelected,
    required this.onTap, required this.image, 
  });
final String address;
 final bool isSelected;
  final VoidCallback onTap;
 final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
     child: Container(padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.allBorderColor),
          borderRadius: BorderRadius.circular(10),color:isSelected
          ?AppColors.secondaryColor:AppColors.svgBackground,),
      child: Row(spacing: 11,mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 36,width: 36,
            child: ClipRRect(borderRadius: BorderRadius.circular(8),
              child: Image.asset( 
            image,
              fit: BoxFit.cover,
                ),
            ),
          ),
          Text(address,style: TextStyle(color:isSelected?AppColors.svgBackground:AppColors.locationColor,
          fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'Inter'),)
        ],
      )),
    );
  }
}