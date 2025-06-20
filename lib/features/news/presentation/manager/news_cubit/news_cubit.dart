import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_stream/core/utils/news_service.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsLoading());

  void fetchGeneralNews() async {
    emit(NewsLoading());
    try {
      var articles = await NewsService().fetchGeneralNews();
      emit(NewsSuccess(articles: articles));
    } catch (e) {
      emit(NewsFailure());
    }
  }
}
