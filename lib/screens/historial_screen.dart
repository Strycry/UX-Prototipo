import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart'; // Para kPrimaryBlue y kSecondaryBlue

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

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
                    "Historial",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/perfil'),
                    child: SvgPicture.asset(
                      "images/perfil.svg",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ✅ Contenido de historial
              Expanded(
                child: ListView(
                  children: [
                    _buildDaySection(
                      "Lunes – 26 de Agosto",
                      [
                        "9:00 am: Eutirox – 2 Cápsulas – Pospuesta",
                        "9:30 am: Eutirox – 2 Cápsulas – Tomada",
                        "11:00 am: Noxpirin – 1 Cápsula – Tomada",
                        "3:00 pm: Noxpirin – 1 Cápsula – Tomada",
                        "7:00 pm: Noxpirin – 1 Cápsula – Tomada",
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildDaySection(
                      "Miércoles – 28 de Agosto",
                      [
                        "9:00 am: Eutirox – 2 Cápsulas – Omitida",
                        "9:30 am: Eutirox – 2 Cápsulas – Tomada",
                        "11:00 am: Noxpirin – 1 Cápsula – Tomada",
                        "4:00 pm: Lasartán – 1 Cápsula – Tomada",
                        "8:00 pm: Ibuprofeno – 2 Cápsulas – Tomada",
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // 🔹 Botón flotante (igual que en Hoy y Home)
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: FloatingActionButton(
          backgroundColor: kPrimaryBlue,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/medicamentos');
          },
          child: const Icon(Icons.add, size: 45, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // 🔹 Barra inferior (igual que en Home y Hoy, con Historial azul)
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
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
                      width: 42,
                      height: 42,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {}, // Ya estamos en Historial
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "images/historial.svg",
                      width: 42,
                      height: 42,
                      color: kPrimaryBlue, // 🔹 Azul activo
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/hoy'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "images/hoy.svg",
                      width: 42,
                      height: 42,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ---------- Widgets auxiliares ----------
  Widget _buildDaySection(String title, List<String> events) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Column(
          children: events.map((event) => _buildTimelineItem(event)).toList(),
        )
      ],
    );
  }

  Widget _buildTimelineItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Punto azul y línea
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: kPrimaryBlue,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 40,
              color: kPrimaryBlue,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
