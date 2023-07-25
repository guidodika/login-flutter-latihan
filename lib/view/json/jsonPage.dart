import 'package:flutter/material.dart';
import '../../model/data.dart';
import '../../utils/data_provider.dart';
import 'data_widget.dart';
import '../../utils/data_util.dart'; // Import file data_util.dart

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  final DataProvider dataProvider = DataProvider();
  Future<List<DataModel>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData('json1.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureData = fetchData('json1.json');
                      });
                    },
                    child: Text('JSON 1'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureData = fetchData('json2.json');
                      });
                    },
                    child: Text('JSON 2'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureData = fetchData('json3.json');
                      });
                    },
                    child: Text('JSON 3'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureData = fetchData('json4.json');
                      });
                    },
                    child: Text('JSON 4'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              "DATA LIST YANG BELUM DIOLAH",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<DataModel>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    List<DataModel>? data = snapshot.data;
                    return SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          Map<String, String> dataMap = dataList[index];
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data!.length,
                                itemBuilder: (context, index) {
                                  String key = dataMap.keys.toList()[index];
                                  String value = dataMap.values.toList()[index];
                                  return Text('$key: $value');
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Failed to load data',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<DataModel>> fetchData(String jsonName) async {
    return dataProvider.fetchData(jsonName);
  }
}
