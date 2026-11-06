import 'package:flutter/material.dart';
import '../models/pelicula.dart';

class DetailScreen extends StatefulWidget {
  final Pelicula pelicula;

  const DetailScreen({super.key, required this.pelicula});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool favorito = false;

  @override
  Widget build(BuildContext context) {
    final pelicula = widget.pelicula;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de película'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'pelicula-${pelicula.id}',
              child: Image.network(
                pelicula.imagen,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 260,
                  color: const Color(0xFF29243A),
                  child: const Center(
                    child: Icon(Icons.movie, size: 70, color: Colors.white54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pelicula.titulo,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${pelicula.anio} • ${pelicula.genero}',
                      style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      _dato(Icons.schedule, pelicula.duracion),
                      const SizedBox(width: 20),
                      _dato(Icons.star, '${pelicula.calificacion}/10'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Sinopsis',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(pelicula.descripcion,
                      style: const TextStyle(
                          color: Colors.white70, height: 1.6, fontSize: 16)),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        setState(() => favorito = !favorito);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(favorito
                                ? 'Agregada a favoritos'
                                : 'Eliminada de favoritos'),
                          ),
                        );
                      },
                      icon: Icon(favorito ? Icons.favorite : Icons.favorite_border),
                      label: Text(favorito
                          ? 'Quitar de favoritos'
                          : 'Agregar a favoritos'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dato(IconData icono, String texto) {
    return Row(
      children: [
        Icon(icono, color: const Color(0xFFC4B5FD), size: 20),
        const SizedBox(width: 6),
        Text(texto, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
