import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_bottom_bar.dart';
import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    // ExploreScreen(),
    // FavoriteScreen(),
    // BookingScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
         onTap: (index) {setState(() {
            currentIndex = index;
          });  }, 
      ),
    );
  }
}