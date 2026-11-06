# CineCatálogo - Proyecto Flutter

Aplicación móvil informativa de un catálogo de películas, desarrollada para cumplir la actividad **Desarrollo de App Móvil Completa en Flutter**.

## Requisitos
- Flutter instalado y configurado.
- Visual Studio Code con la extensión Flutter y Dart.
- Un emulador Android o dispositivo conectado.

## Cómo abrir y ejecutar
1. Descomprime la carpeta `CineCatalogoFlutter`.
2. Abre esa carpeta desde Visual Studio Code.
3. Abre la terminal integrada.
4. Ejecuta:
   ```bash
   flutter pub get
   flutter run
   ```

## Estructura
- `lib/main.dart`: punto de entrada y tema de la aplicación.
- `lib/models/`: modelo de película y datos de ejemplo.
- `lib/screens/`: bienvenida, inicio y detalle.
- `lib/widgets/`: tarjeta reutilizable de película.

## Funciones incluidas
- Splash Screen con indicador de carga y transición automática después de 3 segundos.
- Pantalla principal con AppBar, buscador y filtros por categoría.
- Lista dinámica de películas con tarjetas.
- Navegación a detalle enviando el objeto seleccionado.
- Imagen destacada con Hero.
- Información de duración, género y calificación.
- Botón para agregar o quitar de favoritos.

## Imágenes
Las imágenes se cargan desde URLs de Unsplash, por lo que se necesita conexión a Internet para mostrarlas. La aplicación puede compilarse sin instalar paquetes adicionales.

## Evidencias para entregar
Ejecuta la app y toma capturas de:
1. Pantalla de bienvenida.
2. Pantalla principal con las categorías y tarjetas.
3. Pantalla de detalle de una película.
