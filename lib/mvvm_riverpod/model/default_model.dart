class DefaultModel {
  bool loadingView;


  DefaultModel({this.loadingView = false});

  DefaultModel copyWith({bool? loadingView}) {
    return DefaultModel(
      loadingView: loadingView ?? this.loadingView,
    );
  }
}
