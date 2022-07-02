import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Menu {
  static List<String> list = [];

  static const String key = 'MenuList';

  static void save() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setStringList(key, list);
  }

  static void load() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    list = sp.getStringList(key) ?? list;
  }

  static void add(String str) {
    list.insert(0, str);
    save();
  }

  static void swap(int index1, int index2) {
    if (index1 < 0 ||
        index2 < 0 ||
        index1 >= list.length ||
        index2 >= list.length) return;
    String str = list[index1];
    list[index1] = list[index2];
    list[index2] = str;
    save();
  }

  static void delete(int index) {
    list.removeAt(index);
    save();
  }

  static void goBottom(int index) {
    list.add(list[index]);
    list.removeAt(index);
    save();
  }
}
