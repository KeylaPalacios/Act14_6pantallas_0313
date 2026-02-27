import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});
  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final Color rosaClarito = const Color(0xFFF06292);
  bool _obscure1 = true;
  bool _obscure2 = true;
  final TextEditingController _fechaController = TextEditingController();

  Future<void> _seleccionarFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: rosaClarito)), child: child!),
    );
    if (picked != null) setState(() => _fechaController.text = "${picked.day}/${picked.month}/${picked.year}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: rosaClarito), title: const Text("Keyla Palacios 6J", style: TextStyle(color: Color(0xFFE91E63)))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft, child: Text("Crear cuenta", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: rosaClarito))),
            const SizedBox(height: 20),
            _inputReg("Nombre(s)", Icons.person_outline),
            _inputReg("Apellido", Icons.person_add_alt),
            _inputFecha(),
            _inputReg("Correo electronico", Icons.email_outlined),
            _inputTel(),
            _inputReg("Direccion", Icons.location_on_outlined),
            _inputPass("Contraseña", _obscure1, () => setState(() => _obscure1 = !_obscure1)),
            _inputPass("Confirmar contraseña", _obscure2, () => setState(() => _obscure2 = !_obscure2)),
            const SizedBox(height: 30),
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: rosaClarito, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), onPressed: () => Navigator.pushNamed(context, '/pagina3'), child: const Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 20)))),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _inputReg(String etiqueta, IconData icono) => Padding(padding: const EdgeInsets.only(bottom: 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(etiqueta), TextField(decoration: InputDecoration(prefixIcon: Icon(icono, color: rosaClarito), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))]));
  Widget _inputFecha() => Padding(padding: const EdgeInsets.only(bottom: 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Fecha de nacimiento"), TextField(controller: _fechaController, readOnly: true, onTap: () => _seleccionarFecha(context), decoration: InputDecoration(prefixIcon: Icon(Icons.calendar_today_outlined, color: rosaClarito), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))]));
  Widget _inputTel() => Padding(padding: const EdgeInsets.only(bottom: 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Telefono"), TextField(keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)], decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android_outlined, color: rosaClarito), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))]));
  Widget _inputPass(String label, bool obs, VoidCallback toggle) => Padding(padding: const EdgeInsets.only(bottom: 15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label), TextField(obscureText: obs, decoration: InputDecoration(prefixIcon: IconButton(icon: Icon(obs ? Icons.visibility_off : Icons.visibility, color: rosaClarito), onPressed: toggle), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))]));
}