import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_stream/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'features/news/presentation/views/news_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..fetchGeneralNews(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        title: 'News Stream',
        debugShowCheckedModeBanner: false,
        home: const NewsView(),
      ),
    );
  }
}
