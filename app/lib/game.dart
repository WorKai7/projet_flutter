import 'package:flutter/material.dart';

class Game extends StatelessWidget {
    const Game({super.key});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: SizedBox(
                width: 300,
                child: Column(
                    children: [
                        Image.asset(
                            "assets/images/king.png",
                            width: 250,
                            height: 250,
                        ),
                        SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Make a guess',
                                border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: 12),
                        )
                    ],
                ),
            ),
        );
    }
}