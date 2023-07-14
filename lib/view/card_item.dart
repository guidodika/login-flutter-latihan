import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String name;
  final String keluhan;
  final String birthdate;
  final Function onDelete;

  const CardItem({
    required this.name,
    required this.keluhan,
    required this.birthdate,
    required this.onDelete,
  });
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: isChecked
          ? RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      )
          : null,
      child: ListTile(
        leading: Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Aksi ketika tombol delete ditekan
                widget.onDelete();
              },
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Keluhan: '),
                Expanded(
                  child: Text(
                    widget.keluhan,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Lahir: '),
                Expanded(
                  child: Text(
                    widget.birthdate,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Aksi ketika card ditekan
        },
      ),
    );
  }
}