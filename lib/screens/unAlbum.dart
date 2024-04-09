import 'package:flutter/material.dart';

class unAlbum extends StatelessWidget {
  final String? description;
  final String? nomGroupe;
  final String? image;

  unAlbum({this.description, this.nomGroupe, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Affichage de l'image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Image.asset(
                    'images/' + (image ?? ''), // Chemin de l'image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(description ?? ''),
                    SizedBox(height: 16.0),
                    Text(
                      'Nom du groupe:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(nomGroupe ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
