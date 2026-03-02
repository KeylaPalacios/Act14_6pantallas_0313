import 'package:flutter/material.dart';
import 'paginas/inicio.dart';
import 'paginas/categorias.dart';
import 'paginas/perfil.dart';

void main() {
  runApp(const DivineBeautyApp());
}

class DivineBeautyApp extends StatelessWidget {
  const DivineBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divine Beauty',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Serif',
      ),
      // Definición de rutas nombradas
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPage(),
        '/categorias': (context) => const CategoriasPage(),
        '/perfil': (context) => const PerfilPage(),
      },
    );
  }
}
