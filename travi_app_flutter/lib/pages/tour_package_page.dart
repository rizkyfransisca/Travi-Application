
import 'package:flutter/material.dart';

Card cardWidget({image, title, travelName, period, price, context}) {
  return Card(
    elevation: 3,
    shadowColor: Colors.grey,
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/tour-package/detail',
            arguments:
                TourPackageArguments(image, title, travelName, period, price));
      },
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
            child: Text(
              travelName,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontSize: 13, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4, left: 8),
            child: Text(period,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontSize: 13, color: Colors.grey),
                overflow: TextOverflow.ellipsis),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4, left: 8),
            child: Text(price,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 13),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    ),
  );
}

class TourPackageArguments {
  final String image;
  final String title;
  final String travelName;
  final String period;
  final String price;

  TourPackageArguments(
      this.image, this.title, this.travelName, this.period, this.price);
}

class TourPackagePage extends StatefulWidget {
  const TourPackagePage({Key? key}) : super(key: key);

  @override
  State<TourPackagePage> createState() => _TourPackagePageState();
}

class _TourPackagePageState extends State<TourPackagePage> {
  var images = [
    'assets/images/kintamani.jpg',
    'assets/images/bedugul.jpg',
    'assets/images/kintamani.jpg',
    'assets/images/bedugul.jpg',
  ];

  var titles = [
    'Keliling Bali Selatan dan Bali Timur',
    'Keliling Bali Selatan dan Bali Barat',
    'Keliling Bali',
    'Keliling Bandung dan Majalengka',
  ];

  var travelNames = [
    'Kadek Travel',
    'Mamang Travel',
    'Travelnesia',
    'Travel Kuy'
  ];

  var periods = ['3 Hari', '1 Minggu', '5 Hari', '6 Hari'];

  var prices = ['Rp 750.000', 'Rp 850.000', 'Rp 400.000', 'Rp 520.000'];

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
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 10),
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
            itemCount: travelNames.length,
            itemBuilder: (BuildContext context, int index) {
              return cardWidget(
                  image: images[index],
                  title: titles[index],
                  travelName: travelNames[index],
                  period: periods[index],
                  price: prices[index],
                  context: context);
            },
          ))
        ],
      ),
    );
  }
}
