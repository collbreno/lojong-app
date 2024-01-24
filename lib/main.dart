import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/style/app_theme.dart';
import 'package:lojong/repositories/app_repository.dart';
import 'package:lojong/utils/dio_utils.dart';
import 'package:lojong/views/home_page.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        final dio = Dio(DioUtils.getBaseOptions());
        _addDioInterceptors(dio);
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

  Future<void> _addDioInterceptors(Dio dio) async {
    final cacheDir = await getApplicationCacheDirectory();
    final cacheOptions = CacheOptions(
      store: FileCacheStore(cacheDir.path),
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
    );

    dio.interceptors.add(ChuckerDioInterceptor());
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }
}
