import 'package:flutter/material.dart';
import '../../model/data.dart';
import '../../utils/data_provider.dart';
import 'data_widget.dart';

class Json1Page extends StatelessWidget {
  final DataProvider dataProvider = DataProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON 1'),
      ),
      body: FutureBuilder<List<DataModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DataModel>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return DataWidget(data: data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Failed to load data');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<DataModel>> fetchData() async {
    return dataProvider.fetchData('json1.json');
  }
}
