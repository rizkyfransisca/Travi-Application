import 'package:flutter/material.dart';

class EventFestivalPage extends StatefulWidget {
  const EventFestivalPage({ Key? key }) : super(key: key);

  @override
  State<EventFestivalPage> createState() => _EventFestivalPageState();
}

class _EventFestivalPageState extends State<EventFestivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Event & Festival',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}