abstract class CategorySelectorEvent {
  int position;
  CategorySelectorEvent({required this.position});
}

class ChangeCategorySelectorPosition extends CategorySelectorEvent {
  ChangeCategorySelectorPosition({required super.position});
}
