
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                
                isRecent 
                    ? SvgPicture.asset("assets/icons/history.svg",height: 24,width: 24,)
                    : SvgPicture.asset("assets/icons/Location_black.svg",height: 24,width: 24,),
                const SizedBox(width: 12),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.w600, 
                          color: Colors.black, 
                        ),
                        child: titleWidget,
                      ),
                      const SizedBox(height: 4),
                      //موقع العقار بالرمادي
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.w400, 
                          color: Colors.grey, 
                        ),
                        child: subtitleWidget,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
          height: 1,
        ),
      ],
    );
  }
}
