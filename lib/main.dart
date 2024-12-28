import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/lang/en_lang.dart';
import 'clean_mvvm_riverpod/core/utils/color_schemes.g.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        fontFamily: 'IranSansFM',

      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'IranSansFM',
      ),
      // home: DefaultPage(),
      // home: NotificationPage(),
      home: HomePage(),
    );
  }
}
