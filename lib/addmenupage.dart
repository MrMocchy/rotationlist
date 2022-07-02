import 'package:flutter/material.dart';
import 'package:rotationlist/menu.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add New Menu'),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // テキスト入力
              TextField(
                onChanged: (String value) {
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    // データを変更
                    _text = value;
                  });
                },
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Menu.add(_text);
                        Menu.save();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
