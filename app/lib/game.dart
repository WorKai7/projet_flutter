import 'package:app/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends ConsumerWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStoreProvider);
    final appStore = ref.read(appStoreProvider.notifier);

    return appState.cardToGuess != null ? Center(
      child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              top: 10,
            ),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 205,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.black,
                      image: DecorationImage(
                        image: appState.cardToGuess == null
                            ? NetworkImage(
                                appState.cardToGuess?["iconUrls"]["medium"])
                            : NetworkImage(
                                appState.cardToGuess?["iconUrls"]["medium"]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: appState.opacity),
                            BlendMode.darken),
                        alignment: Alignment.bottomCenter,
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'Make a guess',
                        labelStyle: TextStyle(
                            color: Colors.grey, fontFamily: "ClashRoyale"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        fillColor: Color.fromARGB(220, 50, 50, 50),
                        filled: true),
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    onChanged: (text) {
                      appStore.search(text);
                    }),
                    ...?appState.cardSuggestions?.map((card) => Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(220, 50, 50, 50),
                      ),
                      child: ListTile(
                        title: Text(
                          card["name"]!,
                          style: const TextStyle(
                            fontFamily: "ClashRoyale",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(card["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          appStore.selectCard(card["name"]!);
                        },
                      ),
                    )),
                SizedBox(height: 20),
                if (appState.wrongGuesses!.isNotEmpty) ...[
                  Text(
                    'Mauvaises réponses:',
                    style: TextStyle(
                      fontFamily: "ClashRoyale",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 125,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: appState.wrongGuesses?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.red),
                            image: DecorationImage(
                              image: NetworkImage(appState.wrongGuesses![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          )
        ),
    )

    :

    // Loader
    Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffcc00)),
                ),
                SizedBox(height: 20),
                Text(
                    'Chargement...',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "ClashRoyale",
                        color: Color(0xffffcc00)
                    )
                ),
            ],
        )
    );
  }
}
