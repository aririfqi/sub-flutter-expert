import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTVSeriesRepository extends Mock implements TVSeriesRepository {}

void main() {
  final repository = MockTVSeriesRepository();
  final usecase = SearchTVSeries(repository);
  test('should return a Right with a List of TVSeries', () async {
    when(() => repository.searchTVSeries('69'))
        .thenAnswer((realInvocation) async => Right(<TVSeries>[]));

    final resultEither = await usecase.execute('69');

    resultEither.fold(
      (l) => print('test failed'),
      (r) {
        expect(r, <TVSeries>[]);
      },
    );
  });
}
