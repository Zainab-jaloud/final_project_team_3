import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle defaultStyle;

  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    // اذا كان البحث فارغ أو لا يحوي على الكلمة المبحوث عنها
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(text, style: defaultStyle);
    }

    final int startIndex = text.toLowerCase().indexOf(query.toLowerCase());
    final int endIndex = startIndex + query.length;

    
    final Color highlightColor = AppColors.primaryColor; 

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(text: text.substring(0, startIndex)),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: defaultStyle.copyWith(
              color: highlightColor, 
              fontWeight: defaultStyle.fontWeight ?? FontWeight.bold, 
              fontSize: defaultStyle.fontSize,
            ),
          ),
          TextSpan(text: text.substring(endIndex)),
        ],
      ),
    );
  }
}
