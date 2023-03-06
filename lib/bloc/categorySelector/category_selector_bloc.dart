import 'package:bloc/bloc.dart';

import 'category_selector_event.dart';
import 'category_selector_state.dart';

class CategorySelectorBloc extends Bloc<CategorySelectorEvent, CategorySelectorState> {
  CategorySelectorBloc() : super(CategorySelectorInitialState()) {
    on<CategorySelectorEvent>((event, emit) {
      emit(CategorySelectorState(position: event.position));
    });
  }
}
