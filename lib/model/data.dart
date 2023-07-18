class DataModel {
  String name;
  String columnName;
  bool mandatory;

  DataModel({required this.name, required this.columnName, required this.mandatory});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      columnName: json['column_name'],
      mandatory: json['mandatory'],
    );
  }
}
