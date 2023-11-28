import 'package:flutter/material.dart';

class home extends StatefulWidget {
  int compter; // Ne pas déclarer comme final

  home({Key? key, required this.compter}) : super(key: key);

  @override
  State<home> createState() => _home();
}

class _home extends State<home> {

  void _incrementCounter() {
    setState(() {
      widget.compter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      widget.compter--;
    });
  }

  void _restart() {
    setState(() {
      widget.compter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Image.asset(
            'images/dice.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.scaleDown,
          ),
          Align(
            child: Text(
              '${widget.compter}', // Utilisez widget.compter ici
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.add,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  _incrementCounter();
                },
              ),
              IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  _restart();
                },
              ),
              IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  _decrementCounter();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}