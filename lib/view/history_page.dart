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
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    filteredCardItems = cardItems;
    super.initState();
  }

  void search(String query) {
    List<CardItem> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = cardItems
          .where((cardItem) =>
          cardItem.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredList = cardItems;
    }
    setState(() {
      searchQuery = query;
      filteredCardItems = filteredList;
    });
  }

  void addCardItem(String name, String keluhan, String birthdate) {
    setState(() {
      cardItems.add(CardItem(
          name: name,
          keluhan: keluhan,
          birthdate: birthdate,
          onDelete: () {}));
      filteredCardItems = cardItems;
    });
  }

  void deleteCardItem(int index) {
    setState(() {
      cardItems.removeAt(index);
      filteredCardItems = cardItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Daftar Pasien'),
          automaticallyImplyLeading: false, // Menghilangkan tombol back di AppBar
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0),
              Text(
                'Daftar Pasien',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _searchFocusNode,
                  onChanged: (value) => search(value),
                  decoration: InputDecoration(
                    hintText: 'Cari Pasien',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: filteredCardItems.isEmpty // Tampilkan pesan jika daftar item kosong
                    ? Center(
                  child: Text(
                    'Data Pasien Masih Kosong',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                )
                    : Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: filteredCardItems.length,
                    itemBuilder: (context, index) {
                      return CardItem(
                        name: filteredCardItems[index].name,
                        keluhan: filteredCardItems[index].keluhan,
                        birthdate: filteredCardItems[index].birthdate,
                        onDelete: () => deleteCardItem(index),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TambahPasienPage(onSave: addCardItem),
                        ),
                      );
                      if (result != null) {
                        // Handle result if needed
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text('Tambah Pasien'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
