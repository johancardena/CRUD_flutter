import 'package:flutter/material.dart';
import '../services/data_service.dart';
import 'form_page.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Colección"),
      ),
      body: DataService.coleccion.isEmpty
          ? const Center(
              child: Text(
                "No hay productos guardados",
              ),
            )
          : ListView.builder(
              itemCount: DataService.coleccion.length,
              itemBuilder: (context, index) {
                final producto = DataService.coleccion[index];

                return Card(
                  child: ListTile(
                    title: Text(
                      producto["titulo"],
                    ),
                    subtitle: Text(
                      "${producto["categoria"]} - \$${producto["precio"]}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FormPage(
                                  producto: producto,
                                  index: index,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final confirmar = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Eliminar"),
                                  content: const Text(
                                    "¿Desea eliminar este producto?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text("Cancelar"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: const Text("Eliminar"),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (confirmar == true) {
                              setState(() {
                                DataService.coleccion.removeAt(index);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Producto eliminado"),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
