import 'package:flutter/material.dart';
import 'custom_checkbox.dart'; 

class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.5,horizontal: 4.5),//horizontal: 3.5
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            
            //التشيك بوكس الويدجيت المخصص
            CustomCheckbox(
              hei: 20,
              wid: 20,
              rad:6,//درجة تدوير الحواف
              iconSize: 13,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
