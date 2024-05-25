import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technotafet/objectbox.g.dart';
import 'package:technotafet/ui/page/page.dart';

import 'entities/object_box.dart';

late Store store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  store = (await ObjectBox.create()).store;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Technotafet',
      home: CategoryPage(),
    );
  }
}
