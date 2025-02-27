import 'package:app/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends ConsumerWidget {
    const Game({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final appState = ref.watch(appStoreProvider);
        final appStore = ref.read(appStoreProvider.notifier);

        return Center(
            child: SizedBox(
                width: 300,
                child: Column(
                    children: [
                        SizedBox(height: 20),
                        Container(
                            width: 175,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: appState.cardToGuess == null ? NetworkImage(appState.cardToGuess?["iconUrls"]["medium"]) : NetworkImage(appState.cardToGuess?["iconUrls"]["medium"]) ,
                                    fit: BoxFit.cover
                                )
                            ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Make a guess',
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "ClashRoyale"
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                                fillColor: Color.fromARGB(220, 50, 50, 50),
                                filled: true
                            ),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                            ),
                            onChanged: (text) {
                                appStore.search(text);
                            }
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: appState.cardSuggestions?.length,
                                itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(220, 50, 50, 50),
                                        ),
                                        child: ListTile(
                                            title: Text(
                                                appState.cardSuggestions![index]["name"]!,
                                                style: TextStyle(
                                                    fontFamily: "ClashRoyale",
                                                    fontSize: 16,
                                                    color: Colors.white
                                                ),
                                            ),
                                            leading: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(appState.cardSuggestions![index]["image"]!),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                            ),
                                            onTap: () {
                                                appStore.selectCard(appState.cardSuggestions![index]["name"]!);
                                            },
                                        ),
                                    );
                                },
                            ),
                        )
                    ],
                ),
            ),
        );
    }
}