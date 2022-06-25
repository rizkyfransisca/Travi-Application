import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travi_app/pages/add_event_festival_page.dart';
import 'package:travi_app/pages/add_destination_page.dart';
import 'package:dio/dio.dart';

class Destination {
  final int id;
  final String judul;
  final String lokasi;
  final String deskripsi;
  final String excerpt;
  final String gambar;
  final String createdAt;

  const Destination(this.id, this.judul, this.lokasi, this.deskripsi,
      this.excerpt, this.gambar, this.createdAt);
}

class EventFestival {
  final int id;
  final String judul;
  final String lokasi;
  final String deskripsi;
  final String excerpt;
  final String gambar;
  final String createdAt;

  const EventFestival(this.id, this.judul, this.lokasi, this.deskripsi,
      this.excerpt, this.gambar, this.createdAt);
}

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

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
                padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Destination',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddDestinationPage()));
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
                                    fontFamily: 'Poppins', fontSize: 12),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
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
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'http://192.168.1.6:8000/Gambar/destinations/' + snapshot.data[index].gambar,
                                    width: 150,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) {
                                                return AlertDialog(
                                                  content: const Text("Apakah anda yakin ingin menghapusnya?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Close'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        var url = 'http://192.168.1.6:8000/api/admin/destination/' +
                                                            snapshot.data[index].id.toString();
                                                        await Dio()
                                                            .delete(url);
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: const Text('Ok'),
                                                    )
                                                  ],
                                                );
                                              }
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                            primary: Colors.red
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.delete_forever, size: 18),
                                              Text(
                                                'Delete',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins', fontSize: 12
                                                ),
                                              ),
                                            ],
                                          )
                                        ),
                                        const SizedBox(width: 15),
                                        ElevatedButton(
                                          onPressed: (() {}),
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                              fontFamily: 'Poppins', fontSize: 12
                                            )
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
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Event & Festival',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddEventFestivalPage()));
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
                                  fontFamily: 'Poppins', fontSize: 12),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
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
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'http://192.168.1.6:8000/Gambar/eventfestival/' + snapshot.data[index].gambar,
                                    width: 150,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot.data[index].judul,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return AlertDialog(
                                                      content: const Text("Apakah anda yakin ingin menghapusnya?"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text('Close'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            var url = 'http://192.168.1.6:8000/api/admin/event-festival/' +
                                                                snapshot
                                                                    .data[index]
                                                                    .id
                                                                    .toString();
                                                            await Dio()
                                                                .delete(url);
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {});
                                                          },
                                                          child:
                                                              const Text('Ok'),
                                                        )
                                                      ],
                                                    );
                                                  });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              primary: Colors.red
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.delete_forever, size: 18),
                                                Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins', fontSize: 12
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        const SizedBox(width: 15),
                                        ElevatedButton(
                                            onPressed: (() {}),
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                fontFamily: 'Poppins', fontSize: 12
                                              )
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
        ));
  }
}
