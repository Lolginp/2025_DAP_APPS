import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController inputControllerC = TextEditingController();
  TextEditingController inputControllerU = TextEditingController();
  String inputContra = '';
  String inputUsuar = '';
  IconData visible = Icons.visibility;
  IconData novisible = Icons.visibility_off;
  bool contrasenanovis = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(inputContra),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: inputControllerU,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuario',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: contrasenanovis,
                  controller: inputControllerC,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(onPressed:() {
                setState(() {
                  contrasenanovis = !contrasenanovis;
                });
              }, 
              child: Icon(
                    contrasenanovis ? visible : novisible, 
                    color: Colors.black, 
                    size: 24, 
                  ),
              )
            ]
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  inputContra = inputControllerC.text;
                  inputUsuar = inputControllerU.text;
                  if (inputContra == 'contraseña' && inputUsuar == 'lolo'){
                    inputContra = 'El ingreso es correcta puedes ingresar';
                  }
                  else{
                    inputContra = 'La contraseña y/o ususario son incorrectos ';
                  }
                });
              },
              child: const Text('Ingresar')
          )
        ]),
      ),
    );
  }
}

//SnackBar