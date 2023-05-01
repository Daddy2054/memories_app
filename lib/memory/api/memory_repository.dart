import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'memory_repository.g.dart';

@riverpod
MemoryRepository memoryRepository(MemoryRepositoryRef _) => MemoryRepository();

class MemoryRepository {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getMemories() => _client
      .from('memories')
      .select<List<Map<String, dynamic>>>(
          'id, title, created_at, image_id, profiles (id, username)')
      .order('created_at');
}
