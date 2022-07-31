import 'package:controller/moduels/first_task/provider/provider_first_task.dart';
import 'package:controller/moduels/second_task/second_task.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'moduels/second_task/provider/provider_second_task.dart';


void main() {
  return runApp(const MyApp());
}

/// Represents the MyApp class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirstTaskProvider()),
        ChangeNotifierProvider(create: (context) => SecondTaskProvider()),
      ],
      child: const MaterialApp(
        home:SecondTask(),
      ),
    );
  }
}
