import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/view/tambahPasien_page.dart';

import 'card_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchQuery = '';
  List<CardItem> cardItems = [];
  List<CardItem> filteredCardItems = [];

  @override
  void initState() {
    filteredCardItems = cardItems; // Menginisialisasi filteredCardItems dengan cardItems
    super.initState();
  }

  void search(String query) {
    List<CardItem> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = cardItems
          .where((cardItem) =>
          cardItem.name.toLowerCase().contains(query.toLowerCase())) // Mencari cardItems yang memiliki nama yang mengandung query
          .toList();
    } else {
      filteredList = cardItems;
    }
    setState(() {
      searchQuery = query; // Mengupdate searchQuery dengan query
      filteredCardItems = filteredList; // Mengupdate filteredCardItems dengan filteredList
    });
  }

  void addCardItem(String name, String keluhan, String birthdate) {
    setState(() {
      cardItems.add(CardItem(name: name, keluhan: keluhan, birthdate: birthdate, onDelete: () {})); // Menambahkan CardItem baru ke dalam cardItems
      filteredCardItems = cardItems; // Mengupdate filteredCardItems dengan cardItems
    });
  }

  void deleteCardItem(int index) {
    setState(() {
      cardItems.removeAt(index); // Menghapus CardItem dari cardItems berdasarkan indeks
      filteredCardItems = cardItems; // Mengupdate filteredCardItems dengan cardItems
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pasien'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.0),
            Text(
              'Daftar Pasien', // Judul halaman
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => search(value), // Memanggil fungsi search saat nilai TextField berubah
                decoration: InputDecoration(
                  hintText: 'Cari Pasien', // Hint teks untuk TextField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.search), // Ikon search di sebelah kiri TextField
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  itemCount: filteredCardItems.length, // Jumlah item dalam ListView
                  itemBuilder: (context, index) {
                    return CardItem(
                      name: filteredCardItems[index].name,
                      keluhan: filteredCardItems[index].keluhan,
                      birthdate: filteredCardItems[index].birthdate,
                      // Menghapus CardItem sesuai dengan indeks saat onDelete dipanggil
                      onDelete: () => deleteCardItem(index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      // Menavigasi ke halaman TambahPasienPage dan menunggu hasilnya
                      MaterialPageRoute(
                        builder: (context) => TambahPasienPage(onSave: addCardItem),
                      ),
                    );
                    if (result != null) {
                      // Handle result if needed
                    }
                  },
                  icon: Icon(Icons.add),
                  label: Text('Tambah Pasien'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
