import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const GameHomeScreen(),
    );
  }
}

class GameHomeScreen extends StatefulWidget {
  const GameHomeScreen({super.key});

  @override
  State<GameHomeScreen> createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  // Initial game state
  int money = 1000000000;
  List<String> team = ["Hero 1", "Healer", "Mage"];
  List<String> pets = ["Cute Cat", "Loyal Dog"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Adventure Game Lobby'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Money Display
            Text(
              'Money: \$${money.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            const SizedBox(height: 20),

            // Character Team Section
            const Text(
              'Your Team (Lobby):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: team.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(team[index])),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Pets Section
            const Text(
              'Your Pets:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
             SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.lightBlue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(pets[index])),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),

            // Action Buttons
            Center(
              child: Column(
                children: [
                   ElevatedButton.icon(
                    onPressed: () {
                      // Placeholder for adventure logic
                    },
                    icon: const Icon(Icons.explore),
                    label: const Text('Go on an Adventure!'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18)
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Placeholder for tasks logic
                    },
                     icon: const Icon(Icons.list_alt),
                    label: const Text('View Tasks'),
                  ),
                   const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Placeholder for shop logic
                    },
                     icon: const Icon(Icons.shopping_cart),
                    label: const Text('Go to Shop'),
                  ),
                ],
              ),
            ),
             const Spacer(),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for guider help
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Hello! I am your cute guider! How can I help?')),
          );
        },
        tooltip: 'Ask Guider',
        child: const Icon(Icons.help_outline),
      ),
    );
  }
}
