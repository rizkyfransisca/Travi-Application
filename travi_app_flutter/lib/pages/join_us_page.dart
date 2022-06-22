import 'package:flutter/material.dart';

class JoinUsPage extends StatefulWidget {
  const JoinUsPage({Key? key}) : super(key: key);

  @override
  State<JoinUsPage> createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Join Us',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama/Nama Perusahaan tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Nama/Nama Perusahaan',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Paket Tour tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Nama Paket Tour',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No.Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'No.Telepon',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Alamat',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kegiatan Wisata tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Kegiatan Wisata',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Deskripsi',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pelayanan tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Pelayanan',
                  ),
                ),
                TextFormField(
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Harga',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                content:
                                    Text("Selamat Datang ${myController.text}"),
                              );
                            });
                      }
                    },
                    child: const Text('Mulai Sekarang'))
              ],
            )));
  }
}
