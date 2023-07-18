import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Json3Page extends StatefulWidget {
  @override
  _Json3PageState createState() => _Json3PageState();
}

class _Json3PageState extends State<Json3Page> {
  Future<List<dynamic>> fetchData() async {
    String jsonString = await rootBundle.loadString('assets/json/json3.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> jsonData = data['data'];
    debugPrint('Isi Data : $jsonData');
    return jsonData;
  }

  String getText(String keyName) {
    switch (keyName) {
      case 'Nama':
        return 'Ajeng';
      case 'No HP':
        return '089603915525';
      case 'Tanggal Lahir':
        return '20 November 1999';
      case 'domisili':
        return 'Yogyakarta';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON 3'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> jsonData = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: jsonData.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> itemData = jsonData[index];
                    String name = itemData['name'];
                    String text = getText(name);

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            name + ':',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
