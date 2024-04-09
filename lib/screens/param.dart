import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workspaceflutter/screens/unAlbum.dart';
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

  List<Album> filteredAlbums = []; // Liste des albums filtrés
  TextEditingController searchController = TextEditingController(); // Contrôleur du champ de recherche

  @override
  void initState() {
    super.initState();
    filteredAlbums = albumsMap.values.toList(); // Initialiser la liste filtrée avec tous les albums
    searchController.addListener(searchListener); // Ajouter un écouteur au champ de recherche
  }

  // Méthode pour filtrer les albums en fonction de la recherche
  void searchListener() {
    setState(() {
      filteredAlbums = albumsMap.values.where((album) =>
          album.nomAlbum!.toLowerCase().contains(searchController.text.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Rechercher un album...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAlbums.length,
              itemBuilder: (BuildContext context, int index) {
                Album album = filteredAlbums[index];
                bool isLiked = false; // Définir l'état initial du like
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          album.nomAlbum ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked; // Inverser l'état du like
                            });
                          },
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border, // Utiliser l'icône like avec ou sans remplissage
                            color: isLiked ? Colors.red : null, // Changer la couleur si l'icône est likée
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${album.nomGroupe ?? ''}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    onTap: () {
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => unAlbum(
                            description: album.description,
                            nomGroupe: album.nomGroupe,
                            image: album.image, // Passer le chemin de l'image
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
