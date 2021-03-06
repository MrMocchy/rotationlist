import 'package:flutter/material.dart';
import 'package:rotationlist/addMenuPage.dart';
import 'package:rotationlist/menu.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
  Menu.load();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDeleteEnable = false;

  @override
  void initState() {
    super.initState();
    Menu.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu List'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'sans serif',
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  html.window.open('https://mrmocchy.github.io/', '');
                },
                icon: const Icon(Icons.info)),
            IconButton(
                onPressed: () async {
                  await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AddMenuPage();
                  }));
                  setState(() {});
                },
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  setState(() => isDeleteEnable ^= true);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: ListView.builder(
            itemCount: Menu.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10, height: 50),
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (isDeleteEnable ? 230 : 180),
                                child: Text(
                                  Menu.list[index],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'sans serif',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() => Menu.swap(index, index - 1));
                                },
                                icon: const Icon(Icons.keyboard_arrow_up),
                                iconSize: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() => Menu.swap(index, index + 1));
                                },
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() => Menu.goBottom(index));
                                },
                                icon: const Icon(Icons.vertical_align_bottom),
                                iconSize: 30,
                              ),
                              if (isDeleteEnable)
                                IconButton(
                                  onPressed: () {
                                    setState(() => Menu.delete(index));
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: 30,
                                  color: Colors.red,
                                ),
                            ],
                          ),
                        ]),
                  ),
                ),
              );
            }));
  }
}
