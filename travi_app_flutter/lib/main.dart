import 'package:flutter/material.dart';
import 'package:travi_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavbarButton()
    );
  }
}

class NavbarButton extends StatefulWidget {
  const NavbarButton({ Key? key }) : super(key: key);

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  int _selectedNavbar = 0;

  List pages = [
    const HomePage(),
  ];
  
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}