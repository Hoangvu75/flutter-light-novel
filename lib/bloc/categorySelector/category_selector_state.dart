class CategorySelectorState {
  int position;
  CategorySelectorState({required this.position});
}

class CategorySelectorInitialState extends CategorySelectorState {
  CategorySelectorInitialState(): super(position: 0);
}

