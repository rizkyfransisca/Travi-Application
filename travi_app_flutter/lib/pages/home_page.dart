import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'Hello World',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black
              ),
            )
          ],
        ),
      )
    );
  }
}