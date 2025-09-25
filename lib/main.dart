import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/medicamentos_screen.dart';
import 'screens/medicamento_dias_screen.dart';
import 'screens/rango_horas_screen.dart';
import 'screens/rango_dias_screen.dart';
import 'screens/alarma_creada_screen.dart';
import 'screens/hoy_screen.dart';
import 'screens/historial_screen.dart';
import 'screens/perfil_screen.dart';

const Color kPrimaryBlue = Color(0xFF3B81F4);
const Color kSecondaryBlue = Color(0xFF1E3FAE);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pill Reminder',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryBlue),
      ),
      // Pantalla inicial: la de bienvenida
      home: const LandingScreen(),
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/medicamentos': (context) => const MedicamentosScreen(),
        '/medicamento-dias': (context) => const MedicamentoDiasScreen(),
        '/rango-horas': (context) => const RangoDeHorasScreen(),
        '/rango-dias': (context) => const RangoDeDiasScreen(),
        '/alarma-creada': (context) => const AlarmaCreadaScreen(),
        '/historial': (context) => const HistorialScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/hoy': (context) => const HoyScreen()

      },
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Pill Reminder",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Registrate para empezar",
                style: TextStyle(
                  fontSize: 16,
                  color: kSecondaryBlue,
                ),
              ),

              const SizedBox(height: 200),

              // 🔹 Logo SVG
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  "images/pill-svgrepo-com.svg",
                  width: 150,
                  height: 150,
                ),
              ),

              const Spacer(),

              // Botón Iniciar Sesión
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
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
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Iniciar Sesion",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Botón Crear Cuenta
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
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
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "Crear Cuenta",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

