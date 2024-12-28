import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/lang/en_lang.dart';
import 'clean_mvvm_riverpod/presentation/pages/homepage/home_page.dart';

var L = EnLang();
var isFarsi = L != EnLang();

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: DefaultPage(),
      // home: NotificationPage(),
      home: HomePage(),
    );
  }
}
