import 'package:memories_app/memory/api/memory_repository.dart';
import 'package:memories_app/memory/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_notifier.g.dart';

@riverpod
class MemoryNotifier extends _$MemoryNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    return ref.read(memoryRepositoryProvider).getMemories();
  }
}
