import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class ReadWatchlistTVSeries {
  final TVSeriesRepository repository;
  ReadWatchlistTVSeries(this.repository);

  Future<List<TVSeries>> execute() {
    return repository.readWatchlistTVSeries();
  }
}
