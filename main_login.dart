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
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>(); //La golbal key que es usada a lo largo del código es apra amnetener un estado en este caso de la app, y asignarlo desde otras partes del código. Esto puede ser usado en widgets y en este caso fue usaod para el mensaje del snack bar. Dentro del return material app, se llamara a esta global key lo que permite encontrar el context, para el Scaffold meesage. Esto fue agregado ya que antes sin esta función el mensaje no aparecía. 

  TextEditingController inputControllerC = TextEditingController();
  TextEditingController inputControllerU = TextEditingController();
  String inputContra = '';
  String inputUsuar = '';
  String mensaje = '';
  IconData visible = Icons.visibility;
  IconData novisible = Icons.visibility_off;
  bool contrasenanovis = true;
  Color colorback = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey, //Acá se llama a la 'llave' para obtener el context
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: contrasenanovis,
                  controller: inputControllerC,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(               //Esto permite agregar dentro del text field un icono, en este caso se agrego el de visualización o no visualización. Es decri, para que el texto no se vea o si lo haga. 
                      icon: Icon(
                        contrasenanovis ? visible : novisible, // EL signo de pregunta, cuando esta puesto una vez analiza el contenido de contrasenanovis, si es true entocnes dejara al icono como visible. En caso contrario dejara al icono como novisible.
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          contrasenanovis = !contrasenanovis;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(                       //Boton de ingreso, depende de cual sea la infromación que le entre de los inputController, este enviara un mensaje de ingreso correcto o de ingreso incorrectos
                onPressed: () {
                  setState(() {
                    inputContra = inputControllerC.text;
                    inputUsuar = inputControllerU.text;
                    if (inputContra == 'contraseña' && inputUsuar == 'lolo') {
                      mensaje = 'El ingreso es correcto, puedes ingresar';
                      colorback = Colors.blue;
                    } else {
                      mensaje = 'La contraseña y/o usuario son incorrectos';
                      colorback = Colors.orange;
                    }
                  });
                  scaffoldMessengerKey.currentState!.showSnackBar( //de acuerdo al context obtenido del Scaffold, se puede mostrar el SnackBar
                    SnackBar(
                      content: Text(mensaje),
                      duration: const Duration(seconds: 2),
                      backgroundColor: colorback,
                    ),
                  );
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
