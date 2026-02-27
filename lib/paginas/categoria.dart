import 'package:flutter/material.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({super.key});

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  // Variable para saber qué marca está seleccionada en el menú lateral
  String marcaSeleccionada = "Dior";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Keyla Palacios 6J",
            style: TextStyle(color: Color(0xFFE91E63), fontSize: 16)),
      ),
      body: Column(
        children: [
          const Text(
            "Divine Beauty",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD81B60),
                fontFamily: 'serif'),
          ),
          const SizedBox(height: 10),
          // Barra superior de categorías
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _tabSuperior("Todo", true),
                _tabSuperior("Labiales", false),
                _tabSuperior("Rubores", false),
                _tabSuperior("Mascara", false),
              ],
            ),
          ),
          const Divider(color: Colors.black, thickness: 1, height: 1),
          Expanded(
            child: Row(
              children: [
                // MENÚ LATERAL (Marcas)
                Container(
                  width: 100,
                  decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.black, width: 1)),
                  ),
                  child: ListView(
                    children: [
                      _itemMenuLateral("Dior"),
                      _itemMenuLateral("Yves Saint Laurent"),
                      _itemMenuLateral("Charlotte Tilbury"),
                      _itemMenuLateral("Fenty"),
                      _itemMenuLateral("Patrick Ta"),
                    ],
                  ),
                ),
                // CUADRÍCULA DE PRODUCTOS
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    children: [
                      _itemProducto("Delineador Deep B", "682", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/del.jpg"),
                      _itemProducto("Labial Major head", "746", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labc.jpg"),
                      _itemProducto("Rubor Creme", "710", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/rubc.jpg"),
                      _itemProducto("Gloss Hidra", "600", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/glo.jpg"),
                      _itemProducto("Base Matte", "1100", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/bas.jpg"),
                      _itemProducto("Iluminador Shine", "890", "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/ilu.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 1.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIconBtn(icon: Icons.home_outlined, label: "inicio", route: '/pagina3'),
            _NavIconBtn(icon: Icons.menu, label: "categoría", isSelected: true),
            _NavIconBtn(icon: Icons.near_me_outlined, label: "novedades", route: '/novedades'),
            // CORRECCIÓN: Se añadió la ruta '/carrito' aquí
            _NavIconBtn(icon: Icons.shopping_cart_outlined, label: "carrito", route: '/carrito'),
            _NavIconBtn(icon: Icons.person_outline, label: "yo"),
          ],
        ),
      ),
    );
  }

  // Los métodos _tabSuperior, _itemMenuLateral e _itemProducto se mantienen igual...
  Widget _tabSuperior(String nombre, bool activo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        color: activo ? Colors.grey[200] : Colors.white,
      ),
      child: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _itemMenuLateral(String nombre) {
    bool esSeleccionado = marcaSeleccionada == nombre;
    return GestureDetector(
      onTap: () => setState(() => marcaSeleccionada = nombre),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        decoration: BoxDecoration(
          color: esSeleccionado ? Colors.pink[50] : Colors.white,
          border: const Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Text(
          nombre,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: esSeleccionado ? FontWeight.bold : FontWeight.normal,
            color: esSeleccionado ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _itemProducto(String nombre, String precio, String url) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(url, fit: BoxFit.cover),
            ),
          ),
        ),
        Text(nombre, 
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold), 
          textAlign: TextAlign.center, 
          maxLines: 1, 
          overflow: TextOverflow.ellipsis
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$$precio", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            const Icon(Icons.add_circle_outline, size: 16),
            const Icon(Icons.favorite_border, size: 16),
          ],
        )
      ],
    );
  }
}

// Clase _NavIconBtn se mantiene igual
class _NavIconBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final String? route;

  const _NavIconBtn({required this.icon, required this.label, this.isSelected = false, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) Navigator.pushNamed(context, route!);
      },
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: isSelected ? Colors.pink : Colors.black, size: 28),
                Text(label, style: TextStyle(fontSize: 10, color: isSelected ? Colors.pink : Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}