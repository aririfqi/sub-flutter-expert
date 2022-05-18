import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTVSeriesRepository extends Mock implements TVSeriesRepository {}

void main() {
  final repository = MockTVSeriesRepository();
  final usecase = GetTVSeriesRecommendations(repository);
  test('should return a Right with a List of TVSeries', () async {
    when(() => repository.getTVSeriesRecommendations(69))
        .thenAnswer((realInvocation) async => Right(<TVSeries>[]));

    final resultEither = await usecase.execute(69);

    resultEither.fold(
      (l) => print('test failed'),
      (r) {
        expect(r, <TVSeries>[]);
      },
    );
  });
}
