import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  // Mapa para guardar las cantidades de cada producto por su nombre
  Map<String, int> cantidades = {
    "Base maquillaje Dior": 1,
    "Delineador de ojos CT.": 1,
    "Iluminador Fenty": 1,
    "Labial Yves Saint Laurent": 1,
    "Gloss hidratante": 1,
  };

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Carrito",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD81B60),
                  fontFamily: 'serif'),
            ),
          ),
          const Divider(color: Colors.black, thickness: 1.5),
          
          Expanded(
            child: ListView(
              children: [
                _itemCarrito("Base maquillaje Dior", "color avena", "1200", 
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/download.jpg", Colors.orange[200]!),
                _itemCarrito("Delineador de ojos CT.", "negro", "682", 
                    "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/del.jpg", Colors.black),
                _itemCarrito("Iluminador Fenty", "color brillante amarillo", "850", 
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/ilu.jpg", Colors.yellow[100]!),
                _itemCarrito("Labial Yves Saint Laurent", "color rojo intenso", "1200", 
                    "https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labb.jpg", Colors.red),
                _itemCarrito("Gloss hidratante", "Dior rosa", "800", 
                    "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/gloss.jpg", Colors.pink[100]!),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$ MXN \$ 4,732",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  ),
                  child: const Text("COMPRAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
            _NavIconBtn(icon: Icons.menu, label: "categoría", route: '/categoria'),
            _NavIconBtn(icon: Icons.near_me_outlined, label: "novedades", route: '/novedades'),
            _NavIconBtn(icon: Icons.shopping_cart, label: "carrito", isSelected: true),
            _NavIconBtn(icon: Icons.person_outline, label: "yo"),
          ],
        ),
      ),
    );
  }

  Widget _itemCarrito(String nombre, String detalle, String precio, String url, Color circuloColor) {
    int cantidadActual = cantidades[nombre] ?? 1;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          Container(
            width: 20, height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.5),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
            child: Image.network(url, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Row(
                  children: [
                    Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: circuloColor),
                    ),
                    const SizedBox(width: 5),
                    Text(detalle, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
                Text("\$ $precio MXN", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          // SELECTOR DE CANTIDAD INTERACTIVO
          PopupMenuButton<int>(
            initialValue: cantidadActual,
            onSelected: (int nuevaCantidad) {
              setState(() {
                cantidades[nombre] = nuevaCantidad;
              });
            },
            itemBuilder: (BuildContext context) => [
              for (int i = 1; i <= 5; i++)
                PopupMenuItem(value: i, child: Text("Cantidad: $i")),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Text("$cantidadActual"),
                  const Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.pink : Colors.black, size: 28),
          Text(label, style: TextStyle(fontSize: 10, color: isSelected ? Colors.pink : Colors.black)),
        ],
      ),
    );
  }
}