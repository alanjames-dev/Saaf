import 'package:flutter/material.dart';
import 'package:saaf/screen_home.dart';
import 'package:saaf/screen_identify.dart';
import 'package:saaf/screen_report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Saaf(),
      routes: {
        'home' : (context) =>  Home(),
        'identify' : (context) => const Identify(),
        'report' : (context) => const Report()
      },
    );
  }
}
class Saaf extends StatefulWidget {
  const Saaf
({ Key? key }) : super(key: key);

  @override
  State<Saaf> createState() => _SaafState();
}

class _SaafState extends State<Saaf> {
  final pages= [ Home(), const Identify(), const Report()];
  final titles = const ['Saaf', 'Identify', 'Raise a Complaint']; //for appbar
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[_currentIndex]),),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt_rounded), label: "Identify"),
        BottomNavigationBarItem(icon: Icon(Icons.error), label: "Report"),

      ],),
      
    );
  }
}