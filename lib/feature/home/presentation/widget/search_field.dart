
import 'package:flutter/material.dart';
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
      hintStyle: TextStyle(color: Color(0xFF9DA4AE,),fontWeight: FontWeight.w400,fontSize: 14,fontFamily: 'Inter'),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(width:24,height:24,child: Center(child:
         SvgPicture.asset('assets/icons/Search.svg'))),
      ),
      suffixIcon:SizedBox(width: 27,height: 27,child: Center(child: SvgPicture.asset('assets/icons/Filter.svg'))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide( 
       color:Color(0xFFD2D6DB)  
       )),
      
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide( 
       color:Color(0xFFD2D6DB)  
       ))
      
      
      
      ),),
    ),],);
  }
}

