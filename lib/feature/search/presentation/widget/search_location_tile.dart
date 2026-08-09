
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/text_style.dart';
class SearchLocationTile extends StatelessWidget {
  final Widget titleWidget;    
  final Widget subtitleWidget; 
  final VoidCallback onTap;  
  final bool isRecent; 

  const SearchLocationTile({
    Key? key,
    required this.titleWidget,
    required this.subtitleWidget,
    required this.onTap,
    required this.isRecent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              children: [
                
                Column(
                  children: [
                    isRecent 
                        ? SvgPicture.asset("assets/icons/history.svg",height: 24,width: 24,)
                        : SvgPicture.asset("assets/icons/Location_black.svg",height: 24,width: 24,),
                    const SizedBox(width: 12),
                    SizedBox(height:20,)
                  ],
                ),
                SizedBox(width:12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      DefaultTextStyle(
                        style:  AppTextStyle.optionValueStyle,
                        child: titleWidget,
                      ),
                      const SizedBox(height: 4),
                      //موقع العقار بالرمادي
                      DefaultTextStyle(
                        style:  AppTextStyle.optionLabelStyle,
                        child: subtitleWidget,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
         Divider(
          color: Colors.black12,
          thickness: 0.5,
          height: 1,
          indent:45,
          endIndent: 24,
        //  width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
