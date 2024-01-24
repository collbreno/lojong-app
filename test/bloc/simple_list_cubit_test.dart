import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/bloc/simple_list_cubit.dart';
import 'package:lojong/models/video.dart';

import '../fixtures/video_list.dart';

void main() {
  group('testing $VideoListCubit', () {
    final fix = VideoListFixture();
    late Future<List<VideoModel>> Function() method;
    late Exception exception;

    blocTest(
      'when repository method returns normally, '
      'should emit $LoadingState and $SuccessfulState',
      setUp: () async {
        await fix.init();
        method = () async => fix.videos;
      },
      build: () => VideoListCubit(method),
      act: (bloc) => bloc.load(),
      expect: () => [
        LoadingState<VideoModel>(),
        SuccessfulState<VideoModel>(fix.videos),
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
      build: () => VideoListCubit(method),
      act: (bloc) => bloc.load(),
      expect: () => [
        LoadingState<VideoModel>(),
        ErrorState<VideoModel>(exception),
      ],
    );
  });
}
