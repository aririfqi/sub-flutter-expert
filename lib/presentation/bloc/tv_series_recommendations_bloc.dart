import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_recommendations_event.dart';
part 'tv_series_recommendations_state.dart';

class TvSeriesRecommendationsBloc
    extends Bloc<TvSeriesRecommendationsEvent, TvSeriesRecommendationsState> {
  final GetTVSeriesRecommendations getTVSeriesRecommendations;
  TvSeriesRecommendationsBloc(this.getTVSeriesRecommendations)
      : super(TvSeriesRecommendationsLoading()) {
    on<OnFetchTvSeriesRecommendation>((event, emit) async {
      emit(TvSeriesRecommendationsLoading());

      final result = await getTVSeriesRecommendations.execute(event.id);
      result.fold(
        (failure) {
          emit(TvSeriesRecommendationsError(failure.message));
        },
        (data) {
          emit(TvSeriesRecommendationsHasData(data));
        },
      );
    });
  }
}
