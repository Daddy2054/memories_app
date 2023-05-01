import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/memory/memory.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MemoryNotifier = ref.watch(memoryNotifierProvider);

    return MemoryNotifier.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      data: (data) => MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].title),
          );
        },
      ),
    );
    return Container();
  }
}
