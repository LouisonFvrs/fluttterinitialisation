

import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:workspaceflutter/screens/home.dart';
import 'package:workspaceflutter/screens/nextPage.dart';
import 'package:workspaceflutter/screens/param.dart';

import 'models/my_flutter_app_icons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    final themeStr = await rootBundle.loadString('assets/ThemeAlbum.json');
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    runApp(MyApp(theme : theme));
  }

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({Key? key, required this.theme}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: theme,
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
  home h = new home(compter: 0);

  _getDrawerItemWidget(int pos) {
    switch(pos) {
      case 0:
        return new param();
      case 1:
        return new nextPage(initialValue: h.compter);
      case 2:
        return h;

      default:
        return new Text("Erreur de page");
    }
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          key: Key('appBarPrincipale'),
          title: Text('Aléatoire et Musiques'),
        ),

        Expanded(
            child: Scaffold(
              body: _getDrawerItemWidget(currentPageIndex),
            ),
          ),

          NavigationBar(
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
                icon: Icon(Icons.numbers),
                label: "Calculatrice",
              ),
              NavigationDestination(
                icon: Icon(MyFlutterApp.music),
                label: "Musique",
              ),
            ],
          ),
      ],
    );
  }
}
