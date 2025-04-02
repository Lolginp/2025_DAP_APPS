
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
  String texto = 'Hola';
  double size = 30;
  Color textColor = Colors.black12;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                texto,
                style: TextStyle(fontSize: size, color: textColor),
              ),
              const SizedBox(height: 20),
              Row(   
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        texto = 'Hola';
                      });
                    },
                    child: const Text('MOSTRAR'),
                  ),
                  const SizedBox(width: 20), // Espacio entre los botones
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        texto = ' ';
                      });
                    },
                    child: const Text('BORRAR'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        size =  size + 10;
                      });
                    }, 
                    onLongPress: () {
                      setState(() {
                        size = size *2;
                      });
                    },
                    child:Text("++"),
                  ),
                  const SizedBox(width: 20), // espacio entre los botones
                  ElevatedButton(
                    onPressed:(){
                      setState(() {
                        size =  size - 10;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        size = size /2;
                      });
                    },
                    child: Text("--"),
                  ),
                ],
              ),
              const SizedBox(height: 20), // botones debajo de los del fontsize
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        textColor = Colors.blue;
                      });
                    }, 
                    onLongPress: () {
                      setState(() {
                        textColor = Colors.blueGrey;
                      });
                    },
                    child: Text("AZUL"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed:() {
                      setState(() {
                      textColor = Colors.red;
                      });
                    }, 
                    onLongPress: () {
                      setState(() {
                      textColor = Colors.deepOrange;
                      });
                    },
                    child: Text("ROJO"),
                  ),
                ],
              ),  
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed:() {
                      Text(texto,style: TextStyle(fontFamily:'Rooboto' ),);
                    }, 
                    child:Text("FUENTE"),
                  ),
                  SizedBox(width: 20),
                ],
                ),         
            ],
          ),
        ),
      ),
    );
  }
}