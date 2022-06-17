import 'package:flutter/material.dart';

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
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                'Tour Package',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/kintamani.jpg', fit: BoxFit.cover, width: double.infinity, height: 80,),
                      Container(
                        margin: const EdgeInsets.only(top: 6,left: 8),
                        child: const Text('Keliling Bali Selatan', style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w100),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('3 Hari', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('Rp 750.000', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins', fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/kintamani.jpg', fit: BoxFit.cover, width: double.infinity, height: 80,),
                      Container(
                        margin: const EdgeInsets.only(top: 6,left: 8),
                        child: const Text('Keliling Bali Selatan', style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w100),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('3 Hari', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('Rp 750.000', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins', fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/kintamani.jpg', fit: BoxFit.cover, width: double.infinity, height: 80,),
                      Container(
                        margin: const EdgeInsets.only(top: 6,left: 8),
                        child: const Text('Keliling Bali Selatan', style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w100),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('3 Hari', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('Rp 750.000', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins', fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/kintamani.jpg', fit: BoxFit.cover, width: double.infinity, height: 80,),
                      Container(
                        margin: const EdgeInsets.only(top: 6,left: 8),
                        child: const Text('Keliling Bali Selatan', style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w100),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('3 Hari', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.grey),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 8),
                        child: const Text('Rp 750.000', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins', fontSize: 13)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
