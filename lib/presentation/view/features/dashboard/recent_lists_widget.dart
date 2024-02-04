import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/add_item_dialog.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_title_widget.dart';

class RecentListsGridWidget extends ConsumerWidget {
  const RecentListsGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(listsRepositoryProvider);
    return provider.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DashboardTitleWidget(
                            title: "Recent Lists",
                            addFunction: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddItemWidget(),
                              );
                            }),
                        Expanded(
                            child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                                key: Key(data[index].listId.toString()),
                                onDismissed: (direction) {
                                  ref
                                      .read(listsRepositoryProvider.notifier)
                                      .deleteList(data[index].listId!);
                                },
                                child: Text(data[index].name));
                          },
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
