import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_providers.g.dart';

@riverpod
class Lists extends _$Lists {
  @override
  bool build() {
    return false;
  }

  void toggleTextField() {
    state = !state;
  }
}
