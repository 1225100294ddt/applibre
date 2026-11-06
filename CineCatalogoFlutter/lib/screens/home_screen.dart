import 'package:flutter/material.dart';
import '../models/datos_peliculas.dart';
import '../models/pelicula.dart';
import '../widgets/pelicula_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _busquedaController = TextEditingController();
  String categoriaSeleccionada = 'Todas';
  String busqueda = '';

  final List<String> categorias = [
    'Todas', 'Acción', 'Animación', 'Ciencia ficción', 'Drama', 'Aventura'
  ];

  List<Pelicula> get peliculasFiltradas {
    return peliculas.where((pelicula) {
      final coincideCategoria = categoriaSeleccionada == 'Todas' ||
          pelicula.genero == categoriaSeleccionada;
      final coincideBusqueda = pelicula.titulo.toLowerCase().contains(
        busqueda.toLowerCase(),
      );
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  @override
  void dispose() {
    _busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineCatálogo',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil de usuario')),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 14),
              child: Text('Encuentra algo que te encante',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _busquedaController,
                onChanged: (valor) => setState(() => busqueda = valor),
                decoration: InputDecoration(
                  hintText: 'Buscar película...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFF20202D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 42,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  final seleccionada = categoria == categoriaSeleccionada;
                  return ChoiceChip(
                    label: Text(categoria),
                    selected: seleccionada,
                    onSelected: (_) {
                      setState(() => categoriaSeleccionada = categoria);
                    },
                    selectedColor: const Color(0xFF7C3AED),
                    backgroundColor: const Color(0xFF20202D),
                    labelStyle: TextStyle(
                      color: seleccionada ? Colors.white : Colors.white70,
                    ),
                    side: BorderSide.none,
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Películas (${peliculasFiltradas.length})',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: peliculasFiltradas.isEmpty
                  ? const Center(child: Text('No se encontraron películas.'))
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      itemCount: peliculasFiltradas.length,
                      itemBuilder: (context, index) {
                        final pelicula = peliculasFiltradas[index];
                        return PeliculaCard(
                          pelicula: pelicula,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(pelicula: pelicula),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
