import 'package:flutter/material.dart';
import '../models/medidor.dart';

class AgregarMedidorScreen extends StatefulWidget {
  const AgregarMedidorScreen({super.key});

  @override
  State<AgregarMedidorScreen> createState() => _AgregarMedidorScreenState();
}

class _AgregarMedidorScreenState extends State<AgregarMedidorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numeroClienteController = TextEditingController();
  final _direccionController = TextEditingController();
  final _aliasController = TextEditingController();

  @override
  void dispose() {
    _numeroClienteController.dispose();
    _direccionController.dispose();
    _aliasController.dispose();
    super.dispose();
  }

  void _guardarMedidor() {
    if (_formKey.currentState!.validate()) {
      final nuevoMedidor = Medidor(
        numeroCliente: _numeroClienteController.text,
        direccion: _direccionController.text,
        alias: _aliasController.text,
      );
      
      // Aquí puedes agregar la lógica para guardar el medidor
      // Por ahora solo regresamos a la pantalla anterior
      Navigator.pop(context, nuevoMedidor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar Medidor',
          style: TextStyle(
            color: Color.fromARGB(255, 136, 10, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 136, 10, 1),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Información del Medidor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 136, 10, 1),
                  ),
                ),
                SizedBox(height: 20),
                
                // Campo Número de Cliente
                TextFormField(
                  controller: _numeroClienteController,
                  decoration: InputDecoration(
                    labelText: 'Número de Cliente',
                    hintText: 'Ej: 123456789',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 136, 10, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el número de cliente';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                
                // Campo Dirección
                TextFormField(
                  controller: _direccionController,
                  decoration: InputDecoration(
                    labelText: 'Dirección',
                    hintText: 'Ej: Av. Principal 123, Ciudad',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 136, 10, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la dirección';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                
                // Campo Alias
                TextFormField(
                  controller: _aliasController,
                  decoration: InputDecoration(
                    labelText: 'Alias',
                    hintText: 'Ej: Casa Principal, Oficina',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 136, 10, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un alias';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                
                // Botón Guardar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _guardarMedidor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 136, 10, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Guardar Medidor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 