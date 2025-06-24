import 'package:flutter/material.dart';
import '../models/medidor.dart';
import 'agregar_medidor_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de medidores de ejemplo
  List<Medidor> medidores = [
    Medidor(
      numeroCliente: '123456789',
      direccion: 'Av. Principal 123, Ciudad',
      alias: 'Casa Principal',
    ),
    Medidor(
      numeroCliente: '987654321',
      direccion: 'Calle Secundaria 456, Ciudad',
      alias: 'Oficina',
    ),
  ];

  void _agregarMedidor() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgregarMedidorScreen(),
      ),
    );

    if (resultado != null && resultado is Medidor) {
      setState(() {
        medidores.add(resultado);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selecciona el medidor de luz',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 136, 10, 1),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _agregarMedidor,
                    icon: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 136, 10, 1),
                      size: 20,
                    ),
                    label: Text(
                      'Agregar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 10, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Lista de medidores
              ...medidores.map((medidor) => Card(
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.electric_meter,
                    color: Color.fromARGB(255, 136, 10, 1),
                    size: 30,
                  ),
                  title: Text(
                    medidor.alias,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cliente: ${medidor.numeroCliente}'),
                      Text('Dirección: ${medidor.direccion}'),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    // Aquí puedes agregar la funcionalidad al seleccionar un medidor
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}