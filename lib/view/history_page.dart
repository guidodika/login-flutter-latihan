import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    _loadData();
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
      cardItems.add(
        CardItem(
          name: name,
          keluhan: keluhan,
          birthdate: birthdate,
          onDelete: () {},
        ),
      );
      _saveData();
      updateFilteredCardItems();
    });
  }

  void deleteCardItem(int index) {
    setState(() {
      cardItems.removeAt(index);
      _saveData();
      updateFilteredCardItems();
    });
  }

  void updateFilteredCardItems() {
    setState(() {
      filteredCardItems = searchQuery.isEmpty
          ? cardItems
          : cardItems
              .where((cardItem) => cardItem.name
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
              .toList();
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> items =
        cardItems.map((item) => item.toJson()).toList();
    await prefs.setStringList(
      'cardItems',
      items.map((item) => json.encode(item)).toList(),
    );
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? itemStrings = prefs.getStringList('cardItems');
    if (itemStrings != null) {
      List items = itemStrings.map((item) => json.decode(item)).toList();
      setState(() {
        cardItems = items.map((item) => CardItem.fromJson(item)).toList();
        updateFilteredCardItems();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
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
          automaticallyImplyLeading: false,
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
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : filteredCardItems.isEmpty
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

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TambahPasienPage(onSave: addCardItem),
                        ),
                      );
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
