import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'detail_page.dart';

class ApiExplorerPage extends StatefulWidget {
  const ApiExplorerPage({super.key});

  @override
  State<ApiExplorerPage> createState() => _ApiExplorerPageState();
}

class _ApiExplorerPageState extends State<ApiExplorerPage> {
  List productos = [];

  final ScrollController scrollController = ScrollController();

  int pagina = 0;
  bool cargando = false;

  @override
  void initState() {
    super.initState();

    cargarProductos();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        cargarMas();
      }
    });
  }

  Future<void> cargarProductos() async {
    final datos = await ApiService.obtenerDeals(pagina);

    setState(() {
      productos = datos;
    });
  }

  Future<void> cargarMas() async {
    if (cargando) return;

    cargando = true;

    pagina++;

    final nuevos = await ApiService.obtenerDeals(pagina);

    setState(() {
      productos.addAll(nuevos);
    });

    cargando = false;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explorar API"),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];

          return Card(
            child: ListTile(
              leading: Image.network(
                producto["thumb"],
                width: 50,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image),
              ),
              title: Text(
                producto["title"] ?? "Sin título",
              ),
              subtitle: Text(
                "\$${producto["salePrice"]}",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      producto: producto,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
