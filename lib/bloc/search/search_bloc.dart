import 'package:bloc/bloc.dart';
import 'package:light_novel/bloc/search/search_event.dart';
import 'package:light_novel/bloc/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchEvent>((event, emit) {
      if (event is OnSubmitSearchEvent) {
        emit(SearchState(isSearched: true));
      }
    });
  }
}
