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
                    "CRDLE",
                    style: TextStyle(
                        color: Color(0xffffcc00),
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'ClashRoyale'
                    )
                ),
                backgroundColor: Color(0xff0054b4),
                centerTitle: true,
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover
                )
              ),
              child: pages[index]
            ),
            bottomNavigationBar: NavigationBar(
                backgroundColor: Color(0xff0054b4),
                indicatorColor: Colors.blue,
                selectedIndex: index,
                onDestinationSelected: changePage,
                destinations: [
                    NavigationDestination(icon: Icon(Icons.gamepad, color: Color(0xffffcc00)), label: "Jeu"),
                    NavigationDestination(icon: Icon(Icons.assessment, color: Color(0xffffcc00)), label: "Statistiques"),
                    NavigationDestination(icon: Icon(Icons.collections, color: Color(0xffffcc00)), label: "Collection")
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