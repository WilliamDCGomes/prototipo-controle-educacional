class ReorderListHelper {
  static List reorderList(int oldIndex, int newIndex, List list){
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var itemReordered = list.removeAt(oldIndex);
    list.insert(newIndex, itemReordered);
    return list;
  }
  static List reorderWrap(int oldIndex, int newIndex, List list){
    var itemReordered = list.removeAt(oldIndex);
    list.insert(newIndex, itemReordered);
    return list;
  }
}