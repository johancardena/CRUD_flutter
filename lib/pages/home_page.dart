import 'package:flutter/material.dart';
import 'api_explorer_page.dart';
import 'collection_page.dart';
import 'form_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Explorer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: const Text("Explorar API"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ApiExplorerPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),


            ElevatedButton(
              child: const Text("Mi Colección"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CollectionPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton( 
              child: const Text("Nuevo Producto"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FormPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Acerca de"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AboutPage(),
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
