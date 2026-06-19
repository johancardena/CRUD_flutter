import 'package:flutter/material.dart';
import '../services/data_service.dart';

class DetailPage extends StatelessWidget {
  final Map producto;

  const DetailPage({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto["title"] ?? "Detalle"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Image.network(
              producto["thumb"],
              height: 200,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image, size: 100),
            ),

            const SizedBox(height: 20),

            Text(
              producto["title"] ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Precio: \$${producto["salePrice"]}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Precio normal: \$${producto["normalPrice"]}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),



            Text(
              "Ahorro: ${double.parse(producto["savings"]).toStringAsFixed(2)}%",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Guardar en mi colección"),
              onPressed: () {

                DataService.coleccion.add({
                  "titulo": producto["title"],
                  "categoria": "Videojuego",
                  "precio": producto["salePrice"].toString(),
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Producto guardado"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}