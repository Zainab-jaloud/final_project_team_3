import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(children: [Column(
              children: [
               Row(
                 children: [
                   Text('location'),Icon(Icons.arrow_downward)
                 ],
               ), 
               Row(children: [Icon(Icons.location_disabled_rounded),Text('newyork')],)
              ],
            )],)
          ],
        ),),
      )),
    );
  }
}