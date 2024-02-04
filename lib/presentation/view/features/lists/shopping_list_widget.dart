import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/lists/details_tile_widget.dart';

class ShoppinglistWidget extends ConsumerWidget {
  const ShoppinglistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listsRepoProvider = ref.watch(listsRepositoryProvider);
    return listsRepoProvider.when(
      data: (data) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return DetailsTileWidget(data: data[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
    );
  }
}
