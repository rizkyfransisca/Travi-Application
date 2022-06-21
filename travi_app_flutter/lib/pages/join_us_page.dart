import 'package:flutter/material.dart';

class JoinUsPage extends StatefulWidget {
  const JoinUsPage({ Key? key }) : super(key: key);

  @override
  State<JoinUsPage> createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Join Us',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}