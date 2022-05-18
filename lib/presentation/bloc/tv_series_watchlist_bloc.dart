import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/read_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_watchlist_event.dart';
part 'tv_series_watchlist_state.dart';

class TvSeriesWatchlistBloc
    extends Bloc<TVSeriesWatchlistEvent, TVSeriesWatchlistState> {
  final ReadWatchlistTVSeries readWatchlistTVSeries;
  TvSeriesWatchlistBloc(this.readWatchlistTVSeries)
      : super(TVSeriesWatchlistLoading()) {
    on<OnLoadTVSeriesWatchlist>((event, emit) async {
      emit(TVSeriesWatchlistLoading());

      final result = await readWatchlistTVSeries.execute();

      emit(TVSeriesWatchlistHasData(result));
    });
  }
}
