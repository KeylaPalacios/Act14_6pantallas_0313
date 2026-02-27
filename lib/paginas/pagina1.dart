import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});
  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  bool _oscurecerTexto = true;
  final Color rosaClarito = const Color(0xFFF06292);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Keyla Palacios 6J", style: TextStyle(color: Color(0xFFE91E63), fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(bottom: 5, child: Icon(Icons.spa, size: 75, color: Colors.green.shade400)),
                Positioned(top: 5, child: Icon(Icons.spa, size: 65, color: rosaClarito)),
              ]),
            ),
            Text("DivineBeauty", style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: rosaClarito, letterSpacing: -1)),
            const SizedBox(height: 30),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFFF80AB), Color(0xFFC2185B)]).createShader(bounds),
              child: const Text('Iniciar sesión', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            const SizedBox(height: 25),
            _inputSimple("correo electrónico", Icons.email_outlined),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: Text("contraseña", style: TextStyle(fontSize: 16))),
            TextField(
              obscureText: _oscurecerTexto,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(_oscurecerTexto ? Icons.visibility_off : Icons.visibility, color: rosaClarito),
                  onPressed: () => setState(() => _oscurecerTexto = !_oscurecerTexto),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(height: 30),
            _botonRosa("Entrar", () => Navigator.pushNamed(context, '/pagina3')),
            const SizedBox(height: 25),
            const Text("¿No tienes una cuenta?", style: TextStyle(fontSize: 16)),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/pagina2'),
              child: Text("Regístrate aquí", style: TextStyle(color: rosaClarito, fontWeight: FontWeight.bold, fontSize: 22, decoration: TextDecoration.underline)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _inputSimple(String texto, IconData icono) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(texto, style: const TextStyle(fontSize: 16)),
      const SizedBox(height: 5),
      TextField(decoration: InputDecoration(prefixIcon: Icon(icono, color: rosaClarito), contentPadding: const EdgeInsets.symmetric(horizontal: 20), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
    ]);
  }

  Widget _botonRosa(String texto, VoidCallback accion) {
    return SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: rosaClarito, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), onPressed: accion, child: Text(texto, style: const TextStyle(color: Colors.white, fontSize: 20))));
  }
}