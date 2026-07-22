
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(
      child: TextField(
       decoration: InputDecoration(contentPadding: EdgeInsets.all(14),
         hintText:'Search Property',
      hintStyle:AppTextStyle.locationTextStyl,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(width:24,height:24,child: Center(child:
         SvgPicture.asset('assets/icons/Search.svg'))),
      ),
      suffixIcon:SizedBox(width: 27,height: 27,child: Center(child: SvgPicture.asset('assets/icons/Filter.svg'))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide( 
       color:AppColors.dotColor 
       )),
      
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide( 
       color:AppColors.dotColor 
       ))
      
      
      
      ),),
    ),],);
  }
}

