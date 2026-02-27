import 'package:flutter/material.dart';
import 'paginas/pagina1.dart';
import 'paginas/pagina2.dart';
import 'paginas/pagina3.dart';
import 'paginas/novedades.dart';
import 'paginas/categoria.dart';
import 'paginas/carrito.dart'; // 1. Importamos la nueva página del carrito

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divine Beauty',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // Mantenemos el inicio en la Página 1 como pediste
      initialRoute: '/', 
      routes: {
        '/': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
        '/pagina3': (context) => const Pagina3(),
        '/novedades': (context) => const NovedadesPage(),
        '/categoria': (context) => const CategoriaPage(),
        '/carrito': (context) => const CarritoPage(), // 2. Agregamos la ruta del carrito
      },
    );
  }
}