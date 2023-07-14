import 'package:flutter/material.dart';
import 'package:untitled/view/tambahPasien_page.dart';

import 'card_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchQuery = '';
  List<CardItem> cardItems = [
    CardItem(name: 'Guido', keluhan: "Batuk", birthdate: '14-09-1999', onDelete: () {}),
    CardItem(name: 'Tara', keluhan: "Flu", birthdate: '01-01-1982', onDelete: () {}),
    CardItem(name: 'Radit', keluhan: "Asma", birthdate: '24-05-1992', onDelete: () {}),
    CardItem(name: 'Bima', keluhan: "Diare", birthdate: '27-09-1999', onDelete: () {}),
    CardItem(
        name: 'Agnes', keluhan: "Radang Tenggorokan", birthdate: '04-12-1961', onDelete: () {}),
    CardItem(name: 'Monica', keluhan: "Diabetes", birthdate: '26-07-1999', onDelete: () {}),
  ];


  List<CardItem> filteredCardItems = [];

  void deleteCard(int index) {
    setState(() {
      filteredCardItems.removeAt(index);
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Pasien',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.0),
            Text('Daftar Pasien',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  itemCount: filteredCardItems.length,
                  itemBuilder: (context, index) {
                    return CardItem(
                      name: filteredCardItems[index].name,
                      keluhan: filteredCardItems[index].keluhan,
                      birthdate: filteredCardItems[index].birthdate,
                      onDelete: () => deleteCard(index),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TambahPasienPage()));
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
