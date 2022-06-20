import 'package:flutter/material.dart';
import 'package:travi_app/pages/tour_package_page.dart';
import 'package:travi_app/tour_package.dart';

class TourPackageDetail extends StatefulWidget {
  const TourPackageDetail({Key? key}) : super(key: key);

  @override
  State<TourPackageDetail> createState() => _TourPackageDetailState();
}

class _TourPackageDetailState extends State<TourPackageDetail> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as TourPackage;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Tour Package',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              arguments.image,
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: PhysicalModel(
                elevation: 2,
                color: Colors.white,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          arguments.packageName,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.6),
                        ),
                        const SizedBox(height: 12),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Nama Travel : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.travelName),
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Durasi : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.duration)
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Harga : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.price)
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Kegiatan Wisata : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.activity),
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Pelayanan : ', style: TextStyle(fontWeight: FontWeight.bold) ),
                              TextSpan(text: arguments.service),
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Email : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.email),
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'No Telepon : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.phoneNumber),
                            ]
                          )
                        ),
                        const SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              letterSpacing: 0.4),
                            children: [
                              const TextSpan(text: 'Alamat : ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: arguments.address),
                            ]
                          )
                        ),
                        const SizedBox(height: 26),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                            child: Text(
                              'Mulai Sekarang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, letterSpacing: 0.5),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
