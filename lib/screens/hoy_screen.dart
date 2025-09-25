import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart'; // para usar kPrimaryBlue y kSecondaryBlue

class HoyScreen extends StatelessWidget {
  const HoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              _buildHourSection("8:00 am", const ["Eutirox"]),
              const SizedBox(height: 20),

              _buildHourSection("11:00 am", const [
                "Noxpirin - 3 cápsulas",
                "Eutirox",
              ]),
              const SizedBox(height: 20),

              _buildHourSection("2:00 pm", const [
                "Ibuprofeno",
                "Losartán",
                "Noxpirin",
              ]),
            ],
          ),
        ),
      ),


      // Botón flotante (sin notch)
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

      // Barra inferior (igual que en Home)
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
                    SvgPicture.asset("images/alarmas.svg",
                        width: 42,
                        height: 42,
                        color: Colors.black87),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/historial'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("images/historial.svg",
                        width: 42,
                        height: 42,
                        color: Colors.black87),
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
                    SvgPicture.asset("images/hoy.svg",
                        width: 42,
                        height: 42,
                        color: kPrimaryBlue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sección por hora
  Widget _buildHourSection(String hour, List<String> meds) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hour,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...meds.map((name) => SelectableMedicineCard(name: name)).toList(),
      ],
    );
  }
}

// --------- Tarjeta de medicamento con iconos seleccionables ----------
class SelectableMedicineCard extends StatefulWidget {
  final String name;
  const SelectableMedicineCard({super.key, required this.name});

  @override
  State<SelectableMedicineCard> createState() => _SelectableMedicineCardState();
}

class _SelectableMedicineCardState extends State<SelectableMedicineCard> {
  bool bellSelected = false;
  bool repeatSelected = false;

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => bellSelected = !bellSelected),
                    child: SvgPicture.asset(
                      "images/bell-off.svg",
                      width: 30,
                      height: 30,
                      color: bellSelected ? kPrimaryBlue : Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => setState(() => repeatSelected = !repeatSelected),
                    child: SvgPicture.asset(
                      "images/repeat.svg",
                      width: 30,
                      height: 30,
                      color: repeatSelected ? kPrimaryBlue : Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
