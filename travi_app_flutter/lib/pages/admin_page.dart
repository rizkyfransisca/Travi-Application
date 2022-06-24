import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Destination {
  final int id;
  final String judul;
  final String lokasi;
  final String deskripsi;
  final String excerpt;
  final String gambar;
  final String createdAt;

  const Destination(this.id, this.judul, this.lokasi, this.deskripsi, this.excerpt, this.gambar, this.createdAt);
}

class EventFestival {
  final int id;
  final String judul;
  final String lokasi;
  final String deskripsi;
  final String excerpt;
  final String gambar;
  final String createdAt;

  const EventFestival(this.id, this.judul, this.lokasi, this.deskripsi, this.excerpt, this.gambar, this.createdAt);
}

class AdminPage extends StatefulWidget {
  const AdminPage({ Key? key }) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Future<List<Destination>> getRequestDestination() async {
    String url = "http://192.168.1.6:8000/api/destination";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<Destination> destinations = [];
    for (var data in responseData) {
      Destination destination = Destination(
          data["id"],
          data["judul"],
          data["lokasi"],
          data["deskripsi"],
          data["excerpt"],
          data["gambar"],
          data["created_at"]);

      destinations.add(destination);
    }
    return destinations;
  }
  Future<List<EventFestival>> getRequestEventFestival() async {
    String url = "http://192.168.1.6:8000/api/event-festival";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<EventFestival> eventfestivals = [];
    for (var data in responseData) {
      EventFestival eventfestival = EventFestival(
          data["id"],
          data["judul"],
          data["lokasi"],
          data["deskripsi"],
          data["excerpt"],
          data["gambar"],
          data["created_at"]);

      eventfestivals.add(eventfestival);
    }
    return eventfestivals;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(Icons.logout_outlined),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Admin Travi',
          style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Destination',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      
                    }),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      primary: Colors.green
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 16,
                          ),
                          Text(
                            'New',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FutureBuilder(
              future: getRequestDestination(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 360,
                          height: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                'http://192.168.1.6:8000/Gambar/destinations/' + snapshot.data[index].gambar,
                                width: 150,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      snapshot.data[index].judul,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: (() {
                                          
                                        }),
                                        child: Text(
                                          'Delete'
                                        )
                                      ),
                                      SizedBox(width: 15),
                                      ElevatedButton(
                                        onPressed: (() {
                                          
                                        }),
                                        child: Text(
                                          'Edit'
                                        )
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Event & Festival',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      
                    }),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      primary: Colors.green
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 16,
                          ),
                          Text(
                            'New',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FutureBuilder(
              future: getRequestEventFestival(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 360,
                          height: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                'http://192.168.1.6:8000/Gambar/eventfestival/' + snapshot.data[index].gambar,
                                width: 150,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      snapshot.data[index].judul,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: (() {
                                          
                                        }),
                                        child: Text(
                                          'Delete'
                                        )
                                      ),
                                      SizedBox(width: 15),
                                      ElevatedButton(
                                        onPressed: (() {
                                          
                                        }),
                                        child: Text(
                                          'Edit'
                                        )
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}