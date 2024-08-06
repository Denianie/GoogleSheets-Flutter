import 'package:flutter/material.dart';
import 'package:form/api/sheets/form_sheets_api.dart';
import 'package:form/model/form.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _registerClient(BuildContext context) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final Map<String, String> data = {
      FormFields.id: id,
      FormFields.name: _nameController.text,
      FormFields.email: _emailController.text,
      FormFields.phone: _phoneController.text,
      FormFields.dni: _dniController.text,
    };
    await FormSheetsApi.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Datos guardados correctamente'),
        duration: Duration(seconds: 2),
      ),
    );
    _dniController.clear();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
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
