import 'package:app/collection.dart';
import 'package:app/game.dart';
import 'package:app/statistics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int index = 0;
    final pages = [Game(), Statistics(), Collection()];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "CRDle",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                    )
                ),
                backgroundColor: Colors.blueAccent,
            ),
            body: pages[index],
            bottomNavigationBar: NavigationBar(
                onDestinationSelected: changePage,
                destinations: [
                    NavigationDestination(icon: Icon(Icons.gamepad), label: "Jeu"),
                    NavigationDestination(icon: Icon(Icons.assessment), label: "Statistiques"),
                    NavigationDestination(icon: Icon(Icons.collections), label: "Collection")
                ],
            )
        );
    }

    void changePage(int page) {
        setState(() {
            index = page;
        });
    }
}