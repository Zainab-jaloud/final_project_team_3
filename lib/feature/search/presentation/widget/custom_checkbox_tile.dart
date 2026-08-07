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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            
            //التشيك بوكس الويدجيت المخصص
            CustomCheckbox(
              hei: 20,
              wid: 20,
              rad:5,
              iconSize: 10,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
