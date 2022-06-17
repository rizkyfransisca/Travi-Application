import 'package:flutter/material.dart';
import 'package:travi_app/pages/home_page.dart';
import 'package:travi_app/pages/event_festival_page.dart';
import 'package:travi_app/pages/tour_package_detail_page.dart';
import 'package:travi_app/pages/tour_package_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavbarButton(),
      routes: {
        '/event-festival': (context) => const EventFestivalPage(),
        '/event-festival/detail': (context) => const DetailEventFestival(),
        '/tour-package/detail' : (context) => const TourPackageDetail()
      },
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
    const HomePage(),
    const EventFestivalPage(),
    const TourPackagePage(),
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
            icon: Icon(Icons.beach_access_outlined),
            label: 'Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.festival_outlined),
            label: 'Event & Festival',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_outlined),
            label: 'Tour Package',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Join Us',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}