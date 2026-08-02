
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application/feature/search/presentation/screens/fillter_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(
     
      child: TextField(
         readOnly: true,
         onTap: () {
           context.go('/search'); 
          },
       decoration: InputDecoration(contentPadding: EdgeInsets.all(14),
         hintText:'Search Property',
      hintStyle:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(width:24,height:24,child: Center(child:
         SvgPicture.asset('assets/icons/Search.svg'))),
      ),
      // ربط زر الفلترة مع البوتوم شيت لصفحة الفلترة
      suffixIcon:GestureDetector(
                onTap: () {
          showModalBottomSheet(
            context: context,

            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            barrierColor: Colors.black.withOpacity(0.5), //لون تعتيم الخلفية 
            sheetAnimationStyle: AnimationStyle(//من اجل الانزلاق السلس
            duration: const Duration(milliseconds: 450),
            reverseDuration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic, 
            ),
            builder: (context) {
             return Padding(
              padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
              child: const FilterBottomSheet());
            },
          );
        },
        child: SizedBox(width: 27,height: 27,child: Center(child: SvgPicture.asset('assets/icons/Filter.svg')))),
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

