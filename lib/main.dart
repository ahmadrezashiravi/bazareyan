import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _websites = [
    "https://bazareyan.com/home/",
    "https://bazareyan.com/",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'راهنمای مشاغل کانادا',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF7BC12), // Set the background color to #f7bc12
          title: Row(
            children: [
              Image.asset(
                'icons/logo.png', // Replace with the path to your logo asset
                width: 40.0, // Set the desired width
              ),
              SizedBox(width: 8.0), // Add spacing between the logo and title
              Text(
                'راهنمای مشاغل کانادا',
                style: TextStyle(
                  color: Color(0xFF332E83), // Set the title color to #332e83
                ),
              ),
            ],
          ),
        ),
        body: WebView(
          initialUrl: _websites[_currentIndex],
          javascriptMode: JavascriptMode.unrestricted,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.web),
              label: 'مشاغل تورنتو',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web),
              label: 'مشاغل ونکوور',
            ),
          ],
          onTap: (index) {
            print("Tapped index $index");
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
