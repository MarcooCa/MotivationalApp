import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_app/providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil de Usuario',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tema',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Toggle del tema en el proveedor de temas
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              child: const Text('Cambiar tema'),
            ),
          ],
        ),
      ),
    );
  }
}
