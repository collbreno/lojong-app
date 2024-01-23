import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/app_theme.dart';
import 'package:lojong/repositories/app_repository.dart';
import 'package:lojong/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppRepository(
        Dio(BaseOptions(headers: AppRepository.baseHeaders)),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.createTheme(),
        home: const HomePage(),
      ),
    );
  }
}
