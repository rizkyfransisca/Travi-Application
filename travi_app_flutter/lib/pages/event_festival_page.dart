import 'package:flutter/material.dart';

class EventFestivalPage extends StatefulWidget {
  const EventFestivalPage({ Key? key }) : super(key: key);

  @override
  State<EventFestivalPage> createState() => _EventFestivalPageState();
}

class _EventFestivalPageState extends State<EventFestivalPage> {
  @override
  Widget build(BuildContext context) {
    List<String> img = [
      'assets/images/kebo_keboan.png',
      'assets/images/labuh_sesaji.png',
      'assets/images/larung_sesaji.png',
      'assets/images/grebengan.png',
    ];
    List<String> title = [
      'Upacara Adat Jawa Timur Kebo-Keboan',
      'Upacara Adat Jawa Timur Labuh Sesaji',
      'Upacara Adat Jawa Timur Larung Sesaji',
      'Upacara Adat Jawa Timur Grebengan',
    ];
    List<String> location = [
      'Banyuwangi, Jawa Timur',
      'Magetan, Jawa Timur',
      'Jawa Timur',
      'Jawa Timur',
    ];
    List<String> excerpt = [
      'Pada saat setiap tahun masyarakat daerah Banyuwangi berusaha untuk menjaga sebuah tradisi kemurnian..',
      'Labuh Sesaji adalah salah satu kebiasaan tahunan yang telah digelar di Telaga Sarangan, Magetan..',
      'Upacara adat Larung sesaji berbeda dengan upacara adat Labuh sesaji. Larung sesaji adalah sebuah..',
      'Grebegan adalah salah satu tradisi upacara adat yang memiliki sifat kesyukuran, dilakukan bersama..',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Event & Festival',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/event-festival/detail',
                  arguments: ScreenArguments(
                    img[index],
                    title[index],
                    location[index],
                    excerpt[index]
                  ));
              },
              child: Container(
                // padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      img[index],
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.6
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Lokasi : ' + location[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4
                            ),
                          ),
                          Text(
                            excerpt[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

class ScreenArguments {
  final String img;
  final String title;
  final String location;
  final String excerpt;

  ScreenArguments(this.img, this.title, this.location, this.excerpt);
}

class DetailEventFestival extends StatefulWidget {
  const DetailEventFestival({ Key? key }) : super(key: key);

  @override
  State<DetailEventFestival> createState() => _DetailEventFestivalState();
}

class _DetailEventFestivalState extends State<DetailEventFestival> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Event & Festival',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(
            arguments.img,
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  arguments.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.6
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Lokasi : ' + arguments.location,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: 0.4
                  ),
                ),
                Text(
                  arguments.excerpt,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: 0.4
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