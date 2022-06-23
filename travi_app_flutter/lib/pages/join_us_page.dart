import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class JoinUsPage extends StatefulWidget {
  const JoinUsPage({Key? key}) : super(key: key);

  @override
  State<JoinUsPage> createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final namaPaketController = TextEditingController();
  final emailController = TextEditingController();
  final nomorTeleponController = TextEditingController();
  final alamatController = TextEditingController();
  final kegiatanWisataController = TextEditingController();
  final deskripsiController = TextEditingController();
  final durasiController = TextEditingController();
  final pelayananController = TextEditingController();
  final hargaController = TextEditingController();

  File? uploadedImage;

  Future<void> chooseImage() async {
    var choosedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      uploadedImage = choosedImage;
    });
  }

  Future<void> storeTourPackageData() async {}

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
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: namaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama/Nama Perusahaan tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Nama/Nama Perusahaan',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: namaPaketController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Paket Tour tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Nama Paket Tour',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: nomorTeleponController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No.Telepon tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'No.Telepon',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: alamatController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Alamat',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: kegiatanWisataController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kegiatan Wisata tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Kegiatan Wisata',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: deskripsiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Deskripsi tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Deskripsi',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: pelayananController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pelayanan tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Pelayanan',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: durasiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Durasi tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Durasi',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: hargaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harga tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Harga',
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        //show image here after choosing image
                        child: uploadedImage == null
                            ? Container()
                            : //if uploadimage is null then show empty container
                            Container(
                                //elese show image here
                                child: SizedBox(
                                    height: 150,
                                    child: Image.file(
                                        uploadedImage!) //load image from file
                                    ))),
                    ElevatedButton.icon(
                      onPressed: () {
                        chooseImage();
                      },
                      label: const Text(
                        'Choose Image',
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: const Icon(Icons.folder_open),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.withAlpha(50),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.all(10)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            const url =
                                'http://192.168.1.4:8000/api/tour-package';
                            debugPrint('hello world');
                            String fileName =
                                uploadedImage!.path.split('/').last;
                            var map = new Map<String, dynamic>();
                            map['nama'] = namaController.text;
                            map['nama_paket'] = namaPaketController.text;
                            map['email'] = emailController.text;
                            map['nomor_telepon'] = nomorTeleponController.text;
                            map['alamat'] = alamatController.text;
                            map['kegiatan_wisata'] =
                                kegiatanWisataController.text;
                            map['deskripsi'] = deskripsiController.text;
                            map['durasi'] = durasiController.text;
                            map['pelayanan'] = pelayananController.text;
                            map['harga'] = hargaController.text;
                            map['gambar'] =
                                await MultipartFile.fromFile(uploadedImage!.path, filename: fileName);

                            FormData formData = new FormData.fromMap(map);

                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    content: Text(
                                        "Selamat Datang ${namaController.text}"),
                                  );
                                });

                            debugPrint('hello world');

                            var response =
                                await Dio().post(url, data: formData);

                            debugPrint(namaController.text);
                            debugPrint(namaPaketController.text);
                            debugPrint(emailController.text);
                            debugPrint(nomorTeleponController.text);
                            debugPrint(alamatController.text);
                            debugPrint(kegiatanWisataController.text);
                            debugPrint(deskripsiController.text);
                            debugPrint(durasiController.text);
                            debugPrint(pelayananController.text);
                            debugPrint(hargaController.text);
                            debugPrint(response.statusMessage);
                          }
                        },
                        child: const Text('Mulai Sekarang'))
                  ],
                )),
          ),
        ));
  }
}
