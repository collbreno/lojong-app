import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/style/app_theme.dart';
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
      create: (context) {
        final dio = Dio(BaseOptions(headers: AppRepository.baseHeaders));
        dio.interceptors.add(ChuckerDioInterceptor());
        return AppRepository(dio);
      },
      child: MaterialApp(
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        title: 'Lojong Coll',
        theme: AppTheme.createTheme(),
        home: const HomePage(),
      ),
    );
  }
}
