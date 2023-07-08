import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WillPopScopeHelper {
  static dialogCLoseApp<bool>({required BuildContext context, }){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('Hi!'),
            subtitle: Text(
              "Are you sure you want to CLose the App?",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 90,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(10),
                  minSize: 10,
                  color: Colors.grey.shade400,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child:
                  const Text("Cancel", style: TextStyle(color: Colors.white)),
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.all(10),
                minSize: 10,
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Close Aplikasi",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      title: const Text(
        'Close App Confirmation',
        style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
      elevation: 20.0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          )),
    );
  }
  static dialogToDashboard<bool>({required BuildContext context, }){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('Hi!'),
            subtitle: Text(
              "Yakin mau kembali ke home?",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 90,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(10),
                  minSize: 10,
                  color: Colors.grey.shade400,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child:
                  const Text("Cancel", style: TextStyle(color: Colors.white)),
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.all(10),
                minSize: 10,
                color: Colors.blue,
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return Index();
                  //       },
                  //     ), (route) => false);
                },
                child: const Text("Close Aplikasi",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      title: const Text(
        'Kembali Ke Home',
        style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
      elevation: 20.0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          )),
    );
  }
}
