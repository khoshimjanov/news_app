import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_tdd/features/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:news_tdd/features/news/presentation/pages/news_page.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()
        ..add(
          NewsStarted(),
        ),
      child: const MaterialApp(
        home: NewsPage(),
      ),
    );
  }
}
