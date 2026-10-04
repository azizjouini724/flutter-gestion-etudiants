import 'package:flutter/material.dart';

class Etudiant {
  final String nom;
  final String prenom;
  final String classe;

  Etudiant({
    required this.nom,
    required this.prenom,
    required this.classe,
  });
}

// --- MAIN ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Etudiants',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AcceuilPage(title: 'Accueil'),
    );
  }
}

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key, required this.title});
  final String title;

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  final List<Etudiant> etudiants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: etudiants.isEmpty
          ? const Center(child: Text('Aucun étudiant dans la liste'))
          :  ListView.builder(
        itemCount: etudiants.length,
        itemBuilder: (context, index) {
          final etudiant = etudiants[index];
          return  ListTile (
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmation'),
                    content: Text('Voulez-vous vraiment supprimer ${etudiant.prenom} ${etudiant.nom} ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            etudiants.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Supprimer'),
                      ),
                    ],
                  ),
                );
              },
            ),
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('${etudiant.prenom} ${etudiant.nom}'),
            subtitle: Text('Classe : ${etudiant.classe}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsEtudiantPage(
                    etudiant: etudiant,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nouvelEtudiant = await Navigator.push<Etudiant>(
            context,
            MaterialPageRoute(builder: (context) => const AjoutEtudiantPage()),
          );

          if (nouvelEtudiant != null) {
            setState(() {
              etudiants.add(nouvelEtudiant);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AjoutEtudiantPage extends StatefulWidget {
  const AjoutEtudiantPage({super.key});

  @override
  State<AjoutEtudiantPage> createState() => _AjoutEtudiantPageState();
}

class _AjoutEtudiantPageState extends State<AjoutEtudiantPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController classeController = TextEditingController();

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    classeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom de l\'étudiant',
              ),
            ),
            TextField(
              controller: prenomController,
              decoration: const InputDecoration(
                labelText: 'Prénom de l\'étudiant',
              ),
            ),
            TextField(
              controller: classeController,
              decoration: const InputDecoration(
                labelText: 'Classe de l\'étudiant',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nomController.text.isNotEmpty) {
                  final etudiant = Etudiant(
                    nom: nomController.text,
                    prenom: prenomController.text,
                    classe: classeController.text,
                  );
                  Navigator.pop(context, etudiant);
                }
              },
              child: const Text('Ajouter'),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsEtudiantPage extends StatelessWidget {
  const DetailsEtudiantPage({super.key, required this.etudiant});

  final Etudiant etudiant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail de l'etudiant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Nom : ${etudiant.nom}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Prénom : ${etudiant.prenom}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Classe : ${etudiant.classe}',
                  style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}