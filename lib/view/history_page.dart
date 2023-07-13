import 'package:flutter/material.dart';

import 'card_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchQuery = '';
  List<CardItem> cardItems = [
    CardItem(name: 'Guido', keluhan: "Batuk", birthdate: '14-09-1999'),
    CardItem(name: 'Tara', keluhan: "Flu", birthdate: '01-01-1982'),
    CardItem(name: 'Radit', keluhan: "Asma", birthdate: '24-05-1992'),
    CardItem(name: 'Bima', keluhan: "Diare", birthdate: '27-09-1999'),
    CardItem(
        name: 'Agnes', keluhan: "Radang Tenggorokan", birthdate: '04-12-1961'),
    CardItem(name: 'Monica', keluhan: "Diabetes", birthdate: '26-07-1999'),
  ];

  List<CardItem> filteredCardItems = [];

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
                    return filteredCardItems[index];
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
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


