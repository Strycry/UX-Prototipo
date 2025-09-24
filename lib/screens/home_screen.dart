import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart'; // para usar los colores globales

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con título y perfil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Medicamentos",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    child: SvgPicture.asset(
                      "images/perfil.svg",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Lista de medicamentos
              Expanded(
                child: ListView(
                  children: [
                    _buildMedicineCard("Eutirox"),
                    _buildMedicineCard("Ibuprofeno"),
                    _buildMedicineCard("Losartán"),
                    _buildMedicineCard("Noxpirin"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Botón flotante "+"
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryBlue,
        shape: const CircleBorder(), // 🔹 asegura forma circular
        onPressed: () {
          Navigator.pushNamed(context, '/medicamentos');
        },
        child: const Icon(Icons.add, size: 45, color: Colors.white),
      ),



      // Barra inferior
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("images/alarmas.svg", width: 22, height: 22, color: kPrimaryBlue),
                    const Text("Activo", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              // Historial (gris)
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/historial'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("images/historial.svg",
                        width: 22, height: 22, color: Colors.black87),
                    const SizedBox(height: 2),
                    const Text("Historial",
                        style: TextStyle(fontSize: 12, color: Colors.black87)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/hoy');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("images/hoy.svg", width: 22, height: 22, color: Colors.black87),
                    const Text("Hoy", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  // Método para construir tarjetas de medicamentos
  Widget _buildMedicineCard(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.black12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
