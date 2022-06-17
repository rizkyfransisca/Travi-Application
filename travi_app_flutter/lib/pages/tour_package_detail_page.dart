import 'package:flutter/material.dart';
import 'package:travi_app/pages/tour_package_page.dart';

class TourPackageDetail extends StatefulWidget {
  const TourPackageDetail({Key? key}) : super(key: key);

  @override
  State<TourPackageDetail> createState() => _TourPackageDetailState();
}

class _TourPackageDetailState extends State<TourPackageDetail> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as TourPackageArguments;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            arguments.image,
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
                  'Lokasi : ' + arguments.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: 0.4
                  ),
                ),
                Text(
                  arguments.price,
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
