import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart'; // para usar kPrimaryBlue y kSecondaryBlue

class HoyScreen extends StatelessWidget {
  const HoyScreen({super.key});

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
                    "Hoy",
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

              // Lista de alarmas del día
              _buildHourSection("8:00 am", [
                _buildMedicineCard("Eutirox"),
              ]),
              const SizedBox(height: 20),

              _buildHourSection("11:00 am", [
                _buildMedicineCard("Noxpirin - 3 cápsulas"),
                _buildMedicineCard("Eutirox"),
              ]),
              const SizedBox(height: 20),

              _buildHourSection("2:00 pm", [
                _buildMedicineCard("Ibuprofeno"),
                _buildMedicineCard("Losartán"),
                _buildMedicineCard("Noxpirin"),
              ]),
            ],
          ),
        ),
      ),

      // Botón flotante (sin notch)
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0), // sube un poco el botón
        child: FloatingActionButton(
          backgroundColor: kPrimaryBlue,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/medicamentos');
          },
          child: const Icon(Icons.add, size: 45, color: Colors.white),
        ),
      ),

// 🔹 Quita el notch y usa ubicación manual
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

// Barra inferior
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(

          child: SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/home'),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "images/alarmas.svg",
                          width: 22, height: 22,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 2),
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
                      if (ModalRoute.of(context)?.settings.name != '/hoy') {
                        Navigator.pushNamed(context, '/hoy');
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "images/hoy.svg",
                          width: 22, height: 22,
                          color: kPrimaryBlue,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Hoy",
                          style: TextStyle(fontSize: 12, color: kPrimaryBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),



    );
  }

  // Sección por hora
  Widget _buildHourSection(String hour, List<Widget> meds) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hour,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...meds,
      ],
    );
  }

  // Tarjeta de cada medicamento con iconos
  Widget _buildMedicineCard(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.blueAccent),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  SvgPicture.asset("images/bell-off.svg",
                      width: 28, height: 28, color: Colors.black87),
                  const SizedBox(width: 12),
                  SvgPicture.asset("images/repeat.svg",
                      width: 28, height: 28, color: Colors.black87),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
