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
      appBar: AppBar(
        title: const Text('Ken Burns Slideshow'),
      ),
      body: KenBurnsSlideshow.asset(
        background: Colors.black,
        foreground: Colors.black38,
        images: const [
          'assets/images/1.jpg',
          'assets/images/2.jpg',
          'assets/images/3.jpg',
          'assets/images/4.jpg',
          'assets/images/5.jpg',
        ],
      ),
    );
  }
}
