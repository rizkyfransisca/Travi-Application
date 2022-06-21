import 'package:flutter/material.dart';
import 'package:travi_app/tour_package.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return Card(
    elevation: 3,
    shadowColor: Colors.grey,
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/tour-package/detail',
            arguments: TourPackage(
                image: image,
                packageName: packageName,
                travelName: travelName,
                duration: duration,
                price: price,
                email: email,
                phoneNumber: phoneNumber,
                address: address,
                activity: activity,
                description: description,
                service: service));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
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
            child: Text(currencyFormatter.format(price).toString(),
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

const url = 'http://192.168.1.4:8000';

Future<List<TourPackage>> fetchTourPackages() async {
  final response = await http.get(Uri.parse("$url/api/tour-package"));

  List<dynamic> body = jsonDecode(response.body);
  List<TourPackage> tourPackages =
      body.map((dynamic item) => TourPackage.fromJson(item)).toList();
  return tourPackages;
}

class TourPackagePage extends StatefulWidget {
  const TourPackagePage({Key? key}) : super(key: key);

  @override
  State<TourPackagePage> createState() => _TourPackagePageState();
}

class _TourPackagePageState extends State<TourPackagePage> {
  late Future<List<TourPackage>> futureTourPackages;
  @override
  void initState() {
    super.initState();
    futureTourPackages = fetchTourPackages();
  }

  var images = [
    'assets/images/kintamani.jpg',
    'assets/images/bedugul.jpg',
  ];

  // var packageNames = [
  //   'Keliling Bali Selatan dan Bali Timur',
  //   'Keliling Bali Selatan dan Bali Barat',
  //   'Keliling Bali',
  //   'Keliling Bandung dan Majalengka',
  // ];

  // var travelNames = [
  //   'Kadek Travel',
  //   'Mamang Travel',
  //   'Travelnesia',
  //   'Travel Kuy'
  // ];

  // var durations = ['3 Hari', '1 Minggu', '5 Hari', '6 Hari'];

  // var prices = ['Rp 750.000', 'Rp 850.000', 'Rp 400.000', 'Rp 520.000'];

  // var phoneNumbers = [
  //   '0128392108321038123',
  //   '123981238123',
  //   '1293812938',
  //   '12391239712372193'
  // ];

  // var emails = [
  //   'rizky.royal@gmail.com',
  //   'agusseptyawan@gmail.com',
  //   'raflycincah@gmail.com',
  //   'rizkykhoi@gmail.com'
  // ];

  // var addresses = [
  //   'Desa Munduk, Tabanan',
  //   'Desa Penglipuran',
  //   'Desa Subang',
  //   'Desa JatiWaringin'
  // ];

  // var activities = [
  //   'Berwisata ke kebun raya, berwisata mancing, berwisata berenang',
  //   'Bermain bersama lumba-lumba, ke kebun binatang, launch, berenang',
  //   'Naik kuda, naik gajah, mendaki gunung, bermain air',
  //   'Surfing, mancing ikan hiu, berperahu, bermain main'
  // ];

  // var services = [
  //   'Makan siang, makan malam, makan pagi',
  //   'Mobil mewah, makan malam, makan pagi',
  //   'Hotel bintang 5, makan malam, makan pagi',
  //   'Makan siang, mobil mercedes, makan pagi',
  // ];

  // var descriptions = [
  //   'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
  //   'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
  //   'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
  //   'Paket wisata ini sangat cocok bagi kalian yang sangat sumpek dengan pekerjaan duniawi. Pada paket wisata ini, kita akan mengeksplor Bali bagian utara dengan keindahan alam nya dan kesejukan gunung-gunung nya. Pada paket wisata ini, kita juga akan mengunjungi desa-desa kuno yang ada di Bali utara. Selain itu, kita juga akan melakukan <em>chill&nbsp;</em>di coffee shop yang ada di daerah Kintamani, tentu saja disini kalian juga bisa berswafoto dengan latar gunung batur yang sangat cantik dan menawan. Dan tidak kalah penting, pada paket wisata ini kita juga mengunjungi salah satu kebun raya terbesar yang ada di Bali.',
  // ];

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
              child: FutureBuilder<List<TourPackage>>(
            future: futureTourPackages,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return GridView.builder(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 225, // here set custom Height You Want
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cardWidget(
                        image: url + '/Gambar/Tour%20Package/' + snapshot.data![index].image,
                        packageName: snapshot.data![index].packageName,
                        travelName: snapshot.data![index].travelName,
                        duration: snapshot.data![index].duration,
                        price: snapshot.data![index].price,
                        email: snapshot.data![index].email,
                        phoneNumber: snapshot.data![index].phoneNumber,
                        address: snapshot.data![index].address,
                        activity: snapshot.data![index].activity,
                        description: snapshot.data![index].description,
                        service: snapshot.data![index].service,
                        context: context);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ))
        ],
      ),
    );
  }
}
