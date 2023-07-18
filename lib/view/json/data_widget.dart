import 'package:flutter/material.dart';
import '../../model/data.dart';

class DataWidget extends StatelessWidget {
  final DataModel data;

  DataWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name),
      subtitle: Text(data.columnName),
      leading: Text(data.mandatory ? 'Mandatory' : 'Optional'),
    );
  }
}
