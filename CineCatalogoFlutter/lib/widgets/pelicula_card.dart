import 'package:flutter/material.dart';
import '../models/pelicula.dart';

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;
  final VoidCallback onTap;

  const PeliculaCard({
    super.key,
    required this.pelicula,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF20202D),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Hero(
              tag: 'pelicula-${pelicula.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16)),
                child: Image.network(
                  pelicula.imagen,
                  width: 116,
                  height: 132,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 116,
                    height: 132,
                    color: const Color(0xFF29243A),
                    child: const Icon(Icons.movie, size: 42),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pelicula.titulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text('${pelicula.anio} • ${pelicula.genero}',
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(pelicula.descripcion,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12, height: 1.3)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFBBF24), size: 17),
                        const SizedBox(width: 4),
                        Text('${pelicula.calificacion}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.white54),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
