import 'package:flutter/material.dart';

Card cardWidget({image, title}) {
  return Card(
    elevation: 4,
    shadowColor: Colors.grey,
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 90,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 8),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black87,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: 8),
          child: const Text(
            'By Kadek Travel',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 13, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: 8),
          child: const Text('3 Hari',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 13, color: Colors.grey),
              overflow: TextOverflow.ellipsis),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: 8),
          child: const Text('Rp 750.000',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 13),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
  );
}

class TourPackagePage extends StatefulWidget {
  const TourPackagePage({Key? key}) : super(key: key);

  @override
  State<TourPackagePage> createState() => _TourPackagePageState();
}

class _TourPackagePageState extends State<TourPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Tour Package',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Cari paket tour impian mu disini...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
            primary: false,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 220, // here set custom Height You Want
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return cardWidget(
                  image: 'assets/images/kintamani.jpg',
                  title: 'Keliling Bali Selatan dan Bali Utara');
            },
          ))
        ],
      ),
    );
  }
}
