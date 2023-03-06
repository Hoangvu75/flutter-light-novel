class SearchState {
  bool isSearched;
  SearchState({required this.isSearched});
}

class SearchInitialState extends SearchState {
  SearchInitialState(): super(isSearched: false);
}

