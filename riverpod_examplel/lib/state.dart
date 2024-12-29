class mainState {
  int count;
  mainState({this.count = 0});

  mainState copyWith({int? count}) {
    return mainState(count: count ?? this.count);
  }
}
