import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class WriteWatchlistTVSeries {
  final TVSeriesRepository repository;
  WriteWatchlistTVSeries(this.repository);

  Future<dynamic> execute(List<TVSeries> list) {
    return repository.writeWatchlistTVSeries(list);
  }
}
