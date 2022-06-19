import 'package:flutter/material.dart';

Card cardWidget(
    {image,
    packageName,
    travelName,
    duration,
    price,
    email,
    phoneNumber,
    address,
    activity,
    description,
    service,
    context}) {
  return Card(
    elevation: 3,
    shadowColor: Colors.grey,
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/tour-package/detail',
            arguments: TourPackageArguments(image, packageName, travelName, duration, price, email, phoneNumber, address, activity, description, service));
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
              packageName,
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
            child: Text(duration,
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
  final String packageName;
  final String travelName;
  final String duration;
  final String price;
  final String email;
  final String phoneNumber;
  final String address;
  final String activity;
  final String description;
  final String service;

  TourPackageArguments(
      this.image,
      this.packageName,
      this.travelName,
      this.duration,
      this.price,
      this.email,
      this.phoneNumber,
      this.address,
      this.activity,
      this.description,
      this.service);
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

  var packageNames = [
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

  var durations = ['3 Hari', '1 Minggu', '5 Hari', '6 Hari'];

  var prices = ['Rp 750.000', 'Rp 850.000', 'Rp 400.000', 'Rp 520.000'];

  var phoneNumbers = [
    '0128392108321038123',
    '123981238123',
    '1293812938',
    '12391239712372193'
  ];

  var emails = [
    'rizky.royal@gmail.com',
    'agusseptyawan@gmail.com',
    'raflycincah@gmail.com',
    'rizkykhoi@gmail.com'
  ];

  var addresses = [
    'Desa Munduk, Tabanan',
    'Desa Penglipuran',
    'Desa Subang',
    'Desa JatiWaringin'
  ];

  var activities = [
    'Berwisata ke kebun raya, berwisata mancing, berwisata berenang',
    'Bermain bersama lumba-lumba, ke kebun binatang, launch, berenang',
    'Naik kuda, naik gajah, mendaki gunung, bermain air',
    'Surfing, mancing ikan hiu, berperahu, bermain main'
  ];

  var services = [
    'Makan siang, makan malam, makan pagi',
    'Mobil mewah, makan malam, makan pagi',
    'Hotel bintang 5, makan malam, makan pagi',
    'Makan siang, mobil mercedes, makan pagi',
  ];

  var descriptions = [
    'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
    'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
    'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
    'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
  ];

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
                  packageName: packageNames[index],
                  travelName: travelNames[index],
                  duration: durations[index],
                  price: prices[index],
                  email: emails[index],
                  phoneNumber: phoneNumbers[index],
                  address: addresses[index],
                  activity: activities[index],
                  description: descriptions[index],
                  service: services[index],
                  context: context);
            },
          ))
        ],
      ),
    );
  }
}
