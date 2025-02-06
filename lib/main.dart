import 'package:flutter/material.dart';
import 'features/news/presentation/views/views_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: 'News Stream',
      debugShowCheckedModeBanner: false,
      home: const NewsView(),
    );
  }
}
