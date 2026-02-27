import 'package:flutter/material.dart';

class NovedadesPage extends StatelessWidget {
  const NovedadesPage({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Novedades',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD81B60),
                  ),
                ),
              ),
              const Divider(color: Colors.black, thickness: 1.5, indent: 20, endIndent: 20),
              
              const SectionHeader(title: "Dior."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ProductCard(
                    name: "Base maquillaje", 
                    price: "1200\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/download.jpg",
                  ),
                  ProductCard(
                    name: "Gloss hida", 
                    price: "800\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/gloss.jpg",
                  ),
                  ProductCard(
                    name: "Rubor.", 
                    price: "950\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/rubor.jpg",
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              const Divider(color: Colors.black, thickness: 1, indent: 20, endIndent: 20),

              const SectionHeader(title: "Fenti."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ProductCard(
                    name: "Iluminador", 
                    price: "850\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/main/ilu.jpg",
                  ),
                  ProductCard(
                    name: "Labial hidra", 
                    price: "500\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/fen.jpg",
                  ),
                  ProductCard(
                    name: "Corrector full...", 
                    price: "650\$",
                    imageUrl: "https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/core.jpg",
                  ),
                ],
              ),
              const SizedBox(height: 100), 
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 2)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/pagina3'),
              child: const NavIcon(icon: Icons.home_outlined, label: "comprar"),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/categoria'),
              child: const NavIcon(icon: Icons.list, label: "categoría"),
            ),
            const NavIcon(icon: Icons.near_me, label: "novedades", isSelected: true),
            
            // CORRECCIÓN AQUÍ: Agregamos GestureDetector al carrito
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/carrito'),
              child: const NavIcon(icon: Icons.shopping_cart_outlined, label: "carrito"),
            ),
            
            const NavIcon(icon: Icons.person_outline, label: "yo"),
          ],
        ),
      ),
    );
  }
}

// Widgets de apoyo (SectionHeader, ProductCard, NavIcon se mantienen igual)
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'serif')),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  const ProductCard({super.key, required this.name, required this.price, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 105, height: 140,
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5)),
          child: Column(
            children: [
              Container(
                width: double.infinity, 
                padding: const EdgeInsets.symmetric(vertical: 4), 
                color: Colors.white, 
                child: Text(name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)
              ),
              Expanded(child: Image.network(imageUrl, fit: BoxFit.contain)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), 
            const SizedBox(width: 5), 
            const Icon(Icons.add_circle_outline, size: 20)
          ]
        )
      ],
    );
  }
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  const NavIcon({super.key, required this.icon, required this.label, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.pink : Colors.black;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 30),
        Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}