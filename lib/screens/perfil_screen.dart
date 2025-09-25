import 'package:flutter/material.dart';
import '../main.dart'; // colores globales
import 'package:flutter_svg/flutter_svg.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Botón de retroceso
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: kPrimaryBlue, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Título
              const Text(
                "Gestionar cuenta",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 30),

              SvgPicture.asset(
                "images/perfil.svg",
                width: 150,
                height: 150,
              ),




              const SizedBox(height: 40),

              // Nombre
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nombre:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: TextEditingController(text: "Juan Diego Perez"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kSecondaryBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kSecondaryBlue, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Correo electrónico
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Correo electronico:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: TextEditingController(text: "jperez@uniandes.edu.co"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kSecondaryBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kSecondaryBlue, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
