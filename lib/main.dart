import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/dependencies.dart';

import 'core/config/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencyInjection();

  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
    );
  }
}