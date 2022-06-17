import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    List<String> img = [
      'assets/images/desa_sade_lombok.png',
      'assets/images/warebo.png',
      'assets/images/desa_argosari_lumajang.png',
      'assets/images/Desa_Penglipuran_Bangli_Bali.png',
    ];
    List<String> title = [
      'Desa Sade',
      'Desa Warebo',
      'Desa Argosari',
      'Desa Penglipuran',
    ];
    List<String> location = [
      'Lombok, NTT',
      'Flores, NTT',
      'Lumajang, Jawa Timur',
      'Bangli, Bali',
    ];
    List<String> excerpt = [
      'Lombok memiliki ragam destinasi wisata kelas dunia yang menakjubkan. Tak sekadar pesona alam dan keelokan panorama laut semata..',
      'Rekomendasi destinasi wisata yang wajib kamu kunjungi adalah Desa Wisata Waerebo yang berada di Kabupaten Manggarai, Nusa Tenggara Timur..',
      'Desa Argosari merupakan pintu masuk sebelum mendaki ke puncak B29 dan B30. Wisata yang ditawarkan begitu memanjakan mata Anda yaitu melihat pemandangan keindahan dari sisi yang berbeda Gunung Bromo..',
      'Bali tidak hanya menyajikan beragam keindahan pantai yang mempesona, tetapi juga bisa sebagai objek wisata edukasi yang mempelajari kebudayaan dan adat yang khas, seperti salah satunya ialah..'
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Destination',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/destination/detail',
                      arguments: ScreenArguments(img[index], title[index],
                          location[index], excerpt[index]));
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
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
                                  letterSpacing: 0.6),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Lokasi : ' + location[index],
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  letterSpacing: 0.4),
                            ),
                            Text(
                              excerpt[index],
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  letterSpacing: 0.4),
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
        ));
  }
}

class ScreenArguments {
  final String img;
  final String title;
  final String location;
  final String excerpt;

  ScreenArguments(this.img, this.title, this.location, this.excerpt);
}

class DetailDestination extends StatefulWidget {
  const DetailDestination({Key? key}) : super(key: key);

  @override
  State<DetailDestination> createState() => _DetailDestinationState();
}

class _DetailDestinationState extends State<DetailDestination> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Destination',
          style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
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
                      letterSpacing: 0.6),
                ),
                const SizedBox(height: 12),
                Text(
                  'Lokasi : ' + arguments.location,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      letterSpacing: 0.4),
                ),
                Text(
                  arguments.excerpt,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      letterSpacing: 0.4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
