import 'package:first_flutter_project/Data/loaddata.dart';
import 'package:first_flutter_project/Domain/Affirmation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScaffold extends StatelessWidget {
  const FirstScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
        "Gallary App",
      ))),
      body: const AffirmationList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Key pressed !");
        },
        elevation: 50,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
          child: ListView(
        children: const [
          DrawerHeader(child: Text("Nice drawer !")),
          ListTile(
            title: Text("First Item !"),
          ),
          ListTile(
            title: Text("Second Item !"),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, //here
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (int indexOfItem) {
          print("Item number ${indexOfItem} is clicked !");
        },
      ),
    );
  }
}

class AffirmationList extends StatelessWidget {
  const AffirmationList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Affirmation> affirmations = loadData();

    return ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          Affirmation affirmation = affirmations[index];

          return AffirmationCard(affirmation: affirmation);
        });
  }
}

class AffirmationCard extends StatelessWidget {
  final Affirmation affirmation;
  const AffirmationCard({super.key, required this.affirmation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Card(
        color: const Color.fromARGB(255, 94, 142, 239),
        elevation: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  affirmation.image,
                  height: 194,
                  width: 600,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(3.0),
                child: Text(
                  affirmation.desc,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
