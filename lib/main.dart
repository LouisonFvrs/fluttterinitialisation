import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Découverte de Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPageIndex = 0;
  int _counter = 0;
  int num = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restart() {
    setState(() {
      _counter = 0;
    });
  }

  void _random() {
    setState(() {
      var random = new Random();
      num = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:<Widget>[
        Container(
          child: ListView(
              children: <Widget>[
            Image.asset('images/dice.jpg',
              width: 300,
              height: 200,
              fit: BoxFit.scaleDown,
            ),

                Align(
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
            ],
          ),
        ),

        Container(
            color: Colors.red,
            alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  '$num',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Align(
                child: const Text('Générer un nombre aléatoire'),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: _random,
                      child: Text('Générer')
                ),
              ),
            ],
          )

        ),

        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text("Paramètre"),
        ),
      ][currentPageIndex],

      /*
      Bouton flottant
       */
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 31),
          child: Align(
            alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.exposure_minus_1),),
          ),),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
            child: Icon(Icons.plus_one),),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: _restart,
              child: Text("Reset"),
            ),
          ),
        ],
      ),


      /*
      Barre de navigation
       */
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_circle_right_outlined),
            label: "Page suivante",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}
