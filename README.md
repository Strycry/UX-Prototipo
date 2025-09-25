# PillReminder
Aplicación móvil desarrollada en **Flutter** para gestionar recordatorios de medicamentos. Incluye: - Vista de **Alarmas activas**. - Vista de **Hoy**, con medicamentos del día y controles interactivos. - **Historial** con registro de tomas, omitidas o pospuestas.
## Requisitos previos
Antes de comenzar asegúrate de tener instalado: - [Flutter](https://docs.flutter.dev/get-started/install) (>= 3.19 recomendado). - [Android Studio](https://developer.android.com/studio) o VS Code con la extensión de Flutter. - Un emulador Android (por ejemplo: **Pixel 9 Pro API 36.0**) o un dispositivo físico. - **Java JDK 11 o superior** (Android Studio ya trae uno por defecto). Verifica tu entorno con:
```bash
flutter doctor
```
## Instalación
Clona el repositorio e instala las dependencias:
```bash
git clone https://github.com/tu-usuario/pillreminder.git
cd pillreminder
flutter pub get
```
## Librerías principales
* **Flutter Material** → componentes base para UI. * **flutter_svg** → manejo de iconos e imágenes en formato SVG. Si necesitas instalar manualmente `flutter_svg`:
```bash
flutter pub add flutter_svg
```
## Ejecutar en desarrollo
Para iniciar la aplicación en un emulador o dispositivo conectado:
```bash
flutter run
```
Si quieres generar un APK para instalarlo en cualquier teléfono Android:
```bash
flutter build apk --release
```
El archivo se generará en:
```
build/app/outputs/flutter-apk/app-release.apk
```
También puedes descargar directamente la última versión lista para instalar desde la carpeta `apk/` del repositorio si prefieres probarla sin compilarla.
## Estructura del proyecto
```
lib/
│── main.dart                # Punto de entrada
│── screens/
│   ├── home_screen.dart     # Pantalla principal (Alarmas / Medicamentos)
│   ├── hoy_screen.dart      # Pantalla con los recordatorios de hoy
│   └── historial_screen.dart# Historial de tomas
│                             #demas pantallas
assets/
│── images/                  # Iconos en formato SVG
apk/                         # APKs generados listos para instalar
```
##  Recursos útiles
* [Documentación oficial de Flutter](https://docs.flutter.dev/) * [Documentación de flutter_svg](https://pub.dev/packages/flutter_svg) * [Guía para compilar APKs](https://docs.flutter.dev/deployment/android)
## Autores
* **David Carrillo** * **Juan Suarez**
