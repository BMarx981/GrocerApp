import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginTermsNotifierProvider extends _$LoginTermsNotifierProvider {
  @override
  bool build() {
    return false;
  }

  void checkBoxSelected() {
    state = !state;
  }
}
