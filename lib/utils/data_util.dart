// data_util.dart
List<Map<String, String>> dataList = [
  {
    "Nama": "Ajeng",
    "No HP": "089238123",
    "Tanggal Lahir": "20 Juli 1999",
    "alamat": "Gejayan, Yogyakarta",
    "domisili": "Jakarta",
  },
  {
    "Nama": "Budi",
    "No HP": "082348912",
    "Tanggal Lahir": "10 Mei 1995",
    "alamat": "Jalan Jenderal Sudirman",
    "domisili": "Surabaya",
  },
  {
    "Nama": "Andra",
    "No HP": "082348912",
    "Tanggal Lahir": "10 Mei 1995",
    "alamat": "Jalan Jenderal Sudirman",
    "domisili": "Surabaya",
  },
  {
    "Nama": "Ariel",
    "No HP": "082348912",
    "Tanggal Lahir": "10 Mei 1995",
    "alamat": "Jalan Jenderal Sudirman",
    "domisili": "Surabaya",
  },
  {
    "Nama": "Lukman",
    "No HP": "082348912",
    "Tanggal Lahir": "10 Mei 1995",
    "alamat": "Jalan Jenderal Sudirman",
    "domisili": "Surabaya",
  },
];



String dataUser(int index, String dataName) {
  Map<String, String>? dataMap = dataList[index];
  print(dataMap);
  if (dataMap != null) {
    String? value = dataMap[dataName];
    if (value != null) {
      return value;
    }
  }

  return "";
}


