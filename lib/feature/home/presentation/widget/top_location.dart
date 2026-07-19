import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
// ignore: must_be_immutable
class TopLocation extends StatelessWidget {
 const  TopLocation({
    super.key, required this.address,    required this.isSelected,
    required this.onTap,
  });
final String address;
 final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
     child: Container(padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(10),color:isSelected
          ?AppColors.secondaryColor: Color(0xFFF9F5FF),),
      child: Row(spacing: 11,mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 36,width: 36,
            child: ClipRRect(borderRadius: BorderRadius.circular(8),
              child: Image.asset( 
              AppImages.house1,
              fit: BoxFit.cover,
                ),
            ),
          ),
          Text(address,style: TextStyle(color:isSelected?Color(0xFFF9F5FF):Color(0xFF9DA4AE),fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'Inter'),)
        ],
      )),
    );
  }
}