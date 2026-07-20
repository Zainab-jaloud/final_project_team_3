import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/selected_item.dart';

 

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, required this.currentIndex,required this.onTap ,});
  final int currentIndex;
    final Function(int) onTap;
  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      color: Color(0xFFFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      SelectedItem(icon:'assets/icons/Home.svg', text: 'Home', index:0, currentIndex:widget.currentIndex, onTap:widget.onTap,
       selectedIcon: 'assets/icons/HomeFill.svg',
       ),
      SelectedItem(icon:'assets/icons/Discovery.svg', text: 'Explore', index:1, currentIndex:widget.currentIndex,
       selectedIcon: 'assets/icons/Discovery.svg',
     onTap: widget.onTap),
      SelectedItem(icon:'assets/icons/Heart.svg', text: 'Favorite', index:2, currentIndex:widget.currentIndex,
      onTap:widget.onTap, selectedIcon: 'assets/icons/HeartFill.svg', ),
      SelectedItem(icon:'assets/icons/Document.svg', text: 'My Booking', index:3, currentIndex:widget.currentIndex, 
      selectedIcon: 'assets/icons/DocumenFill.svg',
       onTap: widget.onTap),
      SelectedItem(icon:'assets/icons/Profile.svg', text: 'Profile', index:4, currentIndex:widget.currentIndex, 
      selectedIcon: 'assets/icons/ProfileFill.svg',
        onTap: widget.onTap),
        ]));
  }
}

