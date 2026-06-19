import 'package:flutter/material.dart';
import '../services/data_service.dart';

class FormPage extends StatefulWidget {
  final Map<String, dynamic>? producto;
  final int? index;

  const FormPage({
    super.key,
    this.producto,
    this.index,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final tituloController = TextEditingController();
  final categoriaController = TextEditingController();
  final precioController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.producto != null) {
      tituloController.text = widget.producto!["titulo"];
      categoriaController.text = widget.producto!["categoria"];
      precioController.text = widget.producto!["precio"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.producto == null
              ? "Nuevo Producto"
              : "Editar Producto",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: "Título",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: categoriaController,
              decoration: const InputDecoration(
                labelText: "Categoría",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: precioController,
              decoration: const InputDecoration(
                labelText: "Precio",
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (widget.index != null) {
                  // Editar
                  DataService.coleccion[widget.index!] = {
                    "titulo": tituloController.text,
                    "categoria": categoriaController.text,
                    "precio": precioController.text,
                  };
                } else {
                  // Crear
                  DataService.coleccion.add({
                    "titulo": tituloController.text,
                    "categoria": categoriaController.text,
                    "precio": precioController.text,
                  });
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.index != null
                          ? "Producto actualizado"
                          : "Producto guardado",
                    ),
                  ),
                );

                Navigator.pop(context);
              },
              child: Text(
                widget.index != null
                    ? "Actualizar"
                    : "Guardar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
