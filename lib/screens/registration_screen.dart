import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _registerClient(BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/api/v1/personas/'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'nombres_apellidos': _nameController.text,
      'celular': _phoneController.text,
      'dni': _dniController.text,
      'correo': _emailController.text,
    }),
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos guardados correctamente')),
    );
    _dniController.clear();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
  } else {
    print('Error: ${response.statusCode}');
    print('Response: ${response.body}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al guardar los datos')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Cliente')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _dniController,
              decoration: InputDecoration(labelText: 'DNI'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre Completo'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _registerClient(context),
              child: Text('Registrar Cliente'),
            ),
          ],
        ),
      ),
    );
  }
}
