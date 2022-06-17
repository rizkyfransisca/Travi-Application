import 'package:flutter/material.dart';

Card cardWidget({image, title}) {
  return Card(
    elevation: 3,
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
                fontWeight: FontWeight.w500),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Tour Package',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top:15, bottom: 10),
                  child: const Text(
                    'Temukan paket tour impian mu disini...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.8,
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
              mainAxisExtent: 225, // here set custom Height You Want
            ),
            itemCount: 10,
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
