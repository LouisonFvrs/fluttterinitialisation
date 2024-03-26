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
      nomAlbum: 'And Justice for All',
      description:
      'And Justice for All est le quatrième album studio du groupe de heavy metal Metallica. Sorti le 25 août 1988, il est le premier album du groupe sans leur bassiste fondateur Cliff Burton, décédé dans un accident de bus en 1986.',
      nomGroupe: 'Metallica',
      image: 'And_justice_for_all.jpg',
    ),
    'album2': Album(
      nomAlbum: 'Hardwired',
      description:
      'Hardwired... to Self-Destruct est le dixième album studio du groupe de heavy metal Metallica. Sorti le 18 novembre 2016, c est leur premier album studio depuis Death Magnetic, sorti en 2008.',
      nomGroupe: 'Metallica',
      image: 'Hardwired.jpg',
    ),
    'album3': Album(
      nomAlbum: 'Kill em All',
      description:
      'Kill em All est le premier album studio du groupe de thrash metal Metallica. Sorti le 25 juillet 1983, il est considéré comme l un des premiers albums du genre thrash metal.',
      nomGroupe: 'Metallica',
      image: 'Kill_em_all.jpg',
    ),
    'album4': Album(
      nomAlbum: 'Master of Puppets',
      description:
      'Master of Puppets est le troisième album studio du groupe de thrash metal Metallica. Sorti le 3 mars 1986, il est souvent considéré comme l un des plus grands albums de metal de tous les temps.',
      nomGroupe: 'Metallica',
      image: 'Maste_ of_puppets.jpg',
    ),
    'album5': Album(
      nomAlbum: 'Metallica',
      description:
      'L album Metallica sort en 1991. Avec sa pochette presque entièrement noire, il est rapidement surnommé le Black Album, tant par les fans que les membres du groupe. Cet album est à l heure actuelle le plus grand succès commercial du groupe, avec plus de 30 millions d exemplaires vendus à travers le monde.',
      nomGroupe: 'Metallica',
      image: 'Metallica.jpg',
    ),
    'album6': Album(
      nomAlbum: 'Ride the Lightning',
      description:
      'Ride the Lightning est le deuxième album studio du groupe de thrash metal Metallica. Sorti le 27 juillet 1984, il marque une évolution du son du groupe vers un style plus complexe et mélodique par rapport à leur premier album Kill em All.',
      nomGroupe: 'Metallica',
      image: 'Ride_the_lightning.jpg',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: albumsMap.length,
        itemBuilder: (BuildContext context, int index) {
          String albumKey = albumsMap.keys.elementAt(index);
          Album album = albumsMap[albumKey]!;
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(
                album.nomAlbum ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(album.description ?? ''),
              leading: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('images/' + (album.image ?? '')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
