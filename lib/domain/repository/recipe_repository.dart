// import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repository.g.dart';

@riverpod
class RecipeRepositoryProvider extends _$RecipeRepositoryProvider {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Future<List<RecipeData>> build() {
    return db.select(db.recipes).get();
  }
}
