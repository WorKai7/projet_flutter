import 'package:app/api/api_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStoreState {
    final Map<String, dynamic>? cardToGuess;
    final List<dynamic>? cards;
    final List<Map<String, String>>? cardSuggestions;
    final double opacity;
    final List<String>? wrongGuesses;

    AppStoreState({
        this.cardToGuess,
        this.cards,
        this.cardSuggestions,
        this.opacity = 1,
        this.wrongGuesses
    });

    factory AppStoreState.init() {
        return AppStoreState(
            cardSuggestions: [],
            opacity: 1,
            wrongGuesses: []
        );
    }

    AppStoreState copyWith({
        Map<String, dynamic>? cardToGuess,
        List<dynamic>? cards,
        List<Map<String, String>>? cardSuggestions,
        double? opacity,
        List<String>? wrongGuesses
    }) {
        return AppStoreState(
            cardToGuess: cardToGuess ?? this.cardToGuess,
            cards: cards ?? this.cards,
            cardSuggestions: cardSuggestions ?? this.cardSuggestions,
            opacity: opacity ?? this.opacity,
            wrongGuesses: wrongGuesses ?? this.wrongGuesses
        );
    }
}

final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
    var apiHelper = ref.watch(apiHelperProvider);
    return AppStore(apiHelper: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
    final ApiHelper apiHelper;

    AppStore({required this.apiHelper}) : super(AppStoreState.init()) {
        getCards();
        newRandomCard();
    }

    void newRandomCard() async {
        final data = await apiHelper.getRandomCard();
        state = state.copyWith(cardToGuess: data);
    }

    void getCards() async {
        final data = await apiHelper.getCards();
        state = state.copyWith(cards: data);
    }

    void search(String text) {
        if (text.isNotEmpty) {
            final List<Map<String, String>> suggestions = [];
            state.cards?.forEach((card) {
                if (card["name"].toLowerCase().startsWith(text)) {
                    suggestions.add({"name": card["name"], "image": card["iconUrls"]["medium"]});
                }
            });

            state = state.copyWith(cardSuggestions: suggestions);
        } else {
            state = state.copyWith(cardSuggestions: []);
        }
    }

    void selectCard(String text) {
        // On peut essayer de refactor en donnant la carte direct en parametre
        if (text == state.cardToGuess?["name"]) {
            state = state.copyWith(opacity: 0);
            // On fera en sorte que ca nous mette un popup jsp comment mais on va essayer

        } else {
            bool valid = false;
            state.cards?.forEach((card) {
                if (card["name"] == text) {
                    if (!state.wrongGuesses!.contains(card["iconUrls"]["medium"])) {
                        state.wrongGuesses?.add(card["iconUrls"]["medium"]);
                        valid = true;
                    }
                }
            });

            if (valid) {
                if (state.opacity > 0) {
                    state = state.copyWith(
                        opacity: state.opacity - 0.01,
                        wrongGuesses: state.wrongGuesses
                    );
                } else {
                    state = state.copyWith(
                        wrongGuesses: state.wrongGuesses
                    );
                }
            } else {
                print("Faire apparaitre notification pour dire qu'on a déjà entré la carte");
            }
        }
    }
}