import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/add_list_dialog.dart';
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
                                builder: (context) => AddListWidget(),
                              );
                            }),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                  key: Key(data[index].listId.toString()),
                                  onDismissed: (direction) {
                                    ref
                                        .read(listsRepositoryProvider.notifier)
                                        .deleteList(data[index].listId!);
                                  },
                                  child: GestureDetector(
                                    onTap: () async {
                                      Beamer.of(context)
                                          .beamToNamed('/add_items_to_list');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(width: 2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(data[index].name),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
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
