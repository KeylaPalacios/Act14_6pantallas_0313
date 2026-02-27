import 'package:flutter/material.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

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
          const SizedBox(height: 10),
          const Text(
            "Divine Beauty",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD81B60),
                fontFamily: 'serif'),
          ),
          const Text(
            "Realza tu esencia con\nproductos pensados para ti",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 20),

          // Banner Rosa
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFF8BBD0),
              border: Border(
                top: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check, size: 18),
                      SizedBox(width: 5),
                      Text("Envio gratis",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                    width: 1.5, height: double.infinity, color: Colors.black),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("arriba de", style: TextStyle(fontSize: 11)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.arrow_back, size: 14),
                          Text(" \$ 200 MXN",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cuadrícula
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.only(
                  top: 40, left: 10, right: 10, bottom: 10),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
              children: [
                _itemCategoria("Todo",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/download.jpg"),
                _itemCategoria("Labiales",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/lab.jpg"),
                _itemCategoria("Rubores",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/rubor.jpg"),
                _itemCategoria("Mascara de pestañas",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/mas.jpg"),
                _itemCategoria("Bases",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/baa.jpg"),
                _itemCategoria("Corrector",
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/corr.jpg"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.black, width: 1.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const _NavIcon(
                icon: Icons.home_outlined, label: "inicio", isSelected: true),
            
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/categoria'),
              child: const _NavIcon(icon: Icons.menu, label: "categoría"),
            ),

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/novedades'),
              child: const _NavIcon(
                  icon: Icons.near_me_outlined, label: "novedades"),
            ),
            
            // CORRECCIÓN: Ahora el carrito es interactivo
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/carrito'),
              child: const _NavIcon(icon: Icons.shopping_cart_outlined, label: "carrito"),
            ),

            const _NavIcon(icon: Icons.person_outline, label: "yo"),
          ],
        ),
      ),
    );
  }

  Widget _itemCategoria(String titulo, String url) {
    return Column(
      children: [
        Container(
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) =>
                  const Icon(Icons.brush, color: Colors.pink, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  const _NavIcon(
      {required this.icon, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: isSelected ? Colors.pink : Colors.black),
        Text(label,
            style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.pink : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}