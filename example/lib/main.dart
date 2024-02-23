import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ken_burns_slideshow/ken_burns_slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ken Burns Slideshow',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: KenBurnsSlideshow.asset(
              background: Colors.black,
              foreground: Colors.black26,
              images: const [
                'assets/images/1.jpg',
                'assets/images/2.jpg',
                'assets/images/3.jpg',
                'assets/images/4.jpg',
                'assets/images/5.jpg',
              ],
            ),
          ),
          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xDFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0x1AFFFFFF),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ken Burns\nSlideshow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 2,
                          letterSpacing: 1.88
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
