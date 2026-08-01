import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_bottom_bar.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

  int currentIndex = 0;

  switch (location) {
    case '/home':
      currentIndex = 0;

      case '/explore':
      currentIndex = 1;
      break;
    
    case '/favorite':
      currentIndex = 2;
      break;
    
    case '/mybooking':
      currentIndex = 3;
      break;
    
    case '/profile':
      currentIndex = 4;
      break;
  }
    return Scaffold(
      body:widget.child,
      bottomNavigationBar: CustomBottomBar(
        currentIndex:currentIndex ,
         onTap: (index) {
          switch(index) {
      case 0:
        context.push('/home');
        break;

      case 2:
        context.push('/favorite');
        break;

      case 3:
        context.push('/mybooking');
        break;
        
      case 4:
        context.push('/profile');
        break;
        
        
        
        }
          
          }, 
      ),
    );
  }
}