import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/write_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTVSeriesRepository extends Mock implements TVSeriesRepository {}

void main() {
  final repository = MockTVSeriesRepository();
  final usecase = WriteWatchlistTVSeries(repository);
  test('should return a true if wrote successfully', () async {
    when(() => repository.writeWatchlistTVSeries(<TVSeries>[]))
        .thenAnswer((realInvocation) async => true);

    final result = await usecase.execute(<TVSeries>[]);

    expect(result, true);
  });
}
