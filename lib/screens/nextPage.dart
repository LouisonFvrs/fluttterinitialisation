import 'package:flutter/material.dart';
import 'dart:math' show Random;

class nextPage extends StatefulWidget {
  final int initialValue;

  const nextPage({Key? key, required this.initialValue}) : super(key: key);

  @override
  _nextPageState createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  int _num1 = 0;
  int _num2 = 0;
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _random(); // Appel initial pour générer les nombres aléatoires au démarrage
  }

  void _random() {
    setState(() {
      var random = Random();
      _num1 = random.nextInt(widget.initialValue + 1);
      _num2 = random.nextInt(widget.initialValue + 1);
    });
  }

  void _showPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Résultat'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_num1 + $_num2',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: _textFieldController,
                keyboardType: TextInputType.number,
                maxLength: 25,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Entrer la solution',
                  hintText: 'Entrer un nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _random(); // Appel de la fonction pour générer de nouveaux nombres
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Générer', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 16), // Vous pouvez ajuster la hauteur selon vos préférences

            TextButton(
              onPressed: () {
                if (int.tryParse(_textFieldController.text) == _num1 + _num2) {
                  _showPopup('Bravo ! Vous avez trouvé la bonne réponse.');
                } else {
                  _showPopup('Désolé, la réponse est incorrecte. Veuillez réessayer.');
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Valider', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}