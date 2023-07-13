import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahPasienPage extends StatefulWidget {
  @override
  _TambahPasienState createState() => _TambahPasienState();
}

class _TambahPasienState extends State<TambahPasienPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _keluhanController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _namaController.dispose();
    _keluhanController.dispose();
    _tanggalLahirController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _tanggalLahirController.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pasien'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Keluhan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _keluhanController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Keluhan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Lahir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _selectDate(
                                context); // Panggil fungsi untuk menampilkan kalendar
                          },
                          icon: Icon(Icons.calendar_month),
                        ),
                        Expanded(
                          child: TextFormField(
                            enabled: false,
                            controller: _tanggalLahirController,
                            decoration: const InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1,color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol Simpan ditekan
                String namaLengkap = _namaController.text;
                String keluhan = _keluhanController.text;
                String tanggalLahir = _tanggalLahirController.text;

                // Lakukan sesuatu dengan data yang diinput
                print('Nama Lengkap: $namaLengkap');
                print('Keluhan: $keluhan');
                print('Tanggal Lahir: $tanggalLahir');

                // Reset form
                _namaController.clear();
                _keluhanController.clear();
                _tanggalLahirController.clear();
              },
              child: Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}
