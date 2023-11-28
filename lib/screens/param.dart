import 'package:flutter/material.dart';
import '../models/Album.dart';

class param extends StatefulWidget {
  const param({Key? key}) : super(key: key);

  @override
  State<param> createState() => _param();
}

class _param extends State<param> {
  Map<String, Album> albumsMap = {
    'album1': Album(
      nomAlbum: 'Metallica',
      description:
      'L album Metallica sort en 1991. Avec sa pochette presque entièrement noire, il est rapidement surnommé le Black Album, tant par les fans que les membres du groupe. Cet album est à l heure actuelle le plus grand succès commercial du groupe, avec plus de 30 millions d exemplaires vendus à travers le monde.',
      nomGroupe: 'Metallica',
      image: 'Metallica.jpg',
    ),
    // ... (ajoutez les autres albums)
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: albumsMap.length,
        itemBuilder: (BuildContext context, int index) {
          String albumKey = albumsMap.keys.elementAt(index);
          Album album = albumsMap[albumKey]!;
          return ListTile(
            title: Text(album.nomAlbum ?? ''),
            subtitle: Text(album.description ?? ''),
            leading: Image.asset('images/' + (album.image ?? '')),
          );
        },
      ),
    );
  }
}
