class MyMultiSelectController {
  MyMultiSelectController({this.isSelectingMode = false});

  final Set<int> selectedIndexes = {};
  bool isSelectingMode;

  void toggle(int index) => isSelected(index) ? unselect(index) : select(index);
  bool isSelected(int index) => selectedIndexes.contains(index);
  void select(int index) => selectedIndexes.add(index);
  void unselect(int index) => selectedIndexes.remove(index);
  bool get hasSelections => selectedIndexes.isNotEmpty;
}
