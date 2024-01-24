import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/bloc/model_item_cubit.dart';
import 'package:lojong/models/article_content.dart';

import '../fixtures/article_content.dart';

void main() {
  group('testing $ArticleItemCubit', () {
    final fix = ArticleContentFixture();
    late Future<ArticleContentModel> Function() method;
    late Exception exception;

    blocTest(
      'when repository method returns normally, '
      'should emit $LoadingState and $SuccessfulState',
      setUp: () async {
        await fix.init();
        method = () async => fix.article;
      },
      build: () => ArticleItemCubit(method),
      act: (bloc) => bloc.load(),
      expect: () => [
        LoadingState<ArticleContentModel>(),
        SuccessfulState<ArticleContentModel>(fix.article),
      ],
    );

    blocTest(
      'when repository method throws an $Exception, '
      'should emit $LoadingState and $ErrorState',
      setUp: () async {
        exception = Exception();
        method = () async {
          throw exception;
        };
      },
      build: () => ArticleItemCubit(method),
      act: (bloc) => bloc.load(),
      expect: () => [
        LoadingState<ArticleContentModel>(),
        ErrorState<ArticleContentModel>(exception),
      ],
    );
  });
}
