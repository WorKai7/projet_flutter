import 'package:app/api/api_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStoreState {
    final Map<String, dynamic>? cardToGuess;
    final List<dynamic>? cards;
    final List<Map<String, String>>? cardSuggestions;

    AppStoreState({this.cardToGuess, this.cards, this.cardSuggestions});

    factory AppStoreState.init() {
        return AppStoreState(
            cardSuggestions: []
        );
    }

    AppStoreState copyWith({Map<String, dynamic>? cardToGuess, List<dynamic>? cards, List<Map<String, String>>? cardSuggestions}) {
        return AppStoreState(
            cardToGuess: cardToGuess ?? this.cardToGuess,
            cards: cards ?? this.cards,
            cardSuggestions: cardSuggestions ?? this.cardSuggestions
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

        print(state.cardSuggestions);
    }

    void selectCard(String text) {
        if (text == state.cardToGuess?["name"]) {
            print("ET CEST GAGNEEEEEEEEEE");
        } else {
            print("Essaye encooooore");
        }
    }
}