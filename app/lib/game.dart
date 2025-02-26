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
                        SizedBox(height: 20),
                        Image.asset(
                            "assets/images/king.png",
                            width: 200,
                            height: 200,
                        ),
                        SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Make a guess',
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                                fillColor: Color.fromARGB(220, 122, 122, 122),
                                filled: true
                            ),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                            ),

                        )
                    ],
                ),
            ),
        );
    }
}