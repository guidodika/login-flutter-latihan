import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

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
                decoration: InputDecoration(
                  hintText: 'Cari Pasien',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: const [
                    CardItem(
                        name: 'Guido', keluhan: "Batuk", birthdate: '14-09-1999'),
                    CardItem(
                        name: 'Tara', keluhan: "Flu", birthdate: '01-01-1982'),
                    CardItem(
                        name: 'Radit', keluhan: "Asma", birthdate: '24-05-1992'),
                    CardItem(
                        name: 'Bima', keluhan: "Diare", birthdate: '27-09-1999'),
                    CardItem(
                        name: 'Agnes',
                        keluhan: "Radang Tenggorokan",
                        birthdate: '04-12-1961'),
                    CardItem(
                        name: 'Monica',
                        keluhan: "Diabetes",
                        birthdate: '26-07-1999'),
                  ],
                ),
              ),
            ),
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

class CardItem extends StatefulWidget {
  final String name;
  final String keluhan;
  final String birthdate;

  const CardItem({
    required this.name,
    required this.keluhan,
    required this.birthdate,
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
              child: Text(widget.name),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Aksi ketika tombol delete ditekan
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
