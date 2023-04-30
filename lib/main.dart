import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:memories_app/core/core.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://zzswdumpoheouxqueitt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp6c3dkdW1wb2hlb3V4cXVlaXR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI4NzU1NDUsImV4cCI6MTk5ODQ1MTU0NX0.3vKidZvChIg5XlQMO-mr-nhvdGlVw1znhlvgN97q0kI',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);
    return MaterialApp.router(
      title: 'Memories App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: routes,
    );
  }
}