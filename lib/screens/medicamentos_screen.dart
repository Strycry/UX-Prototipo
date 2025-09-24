import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart'; // para usar los colores globales

class MedicamentosScreen extends StatelessWidget {
  const MedicamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícono de la píldora
              Center(
                child: SvgPicture.asset(
                  "images/pill-svgrepo-com.svg",
                  width: 80,
                  height: 80,
                ),
              ),

              const SizedBox(height: 30),

              // Nombre del medicamento
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nombre del medicamento",
                  style: TextStyle(
                    fontSize:30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),

              const SizedBox(height: 70),

              // Frecuencia
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Frecuencia:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Botones de frecuencia
              _buildFrequencyButton("Una vez al dia", context, '/medicamento-dias'),
              const SizedBox(height: 35),
              _buildFrequencyButton("Dos veces al dia", context, '/medicamento-dias'),
              const SizedBox(height: 35),
              _buildFrequencyButton("Cada X horas al dia", context, '/rango-horas'), // aún no implementado
              const SizedBox(height: 35),
              _buildFrequencyButton("Cada X dias", context, '/rango-dias'), // aún no implementado
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir botones de frecuencia
  Widget _buildFrequencyButton(String text, BuildContext context, String? route) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          if (route != null) {
            Navigator.pushNamed(context, route);
          }
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize:20),
        ),
      ),
    );
  }
}
