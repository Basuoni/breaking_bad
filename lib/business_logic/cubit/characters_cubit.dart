import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Character.dart';
import '../../data/repository/characters.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  static CharactersCubit get(context) =>
      BlocProvider.of<CharactersCubit>(context);
  CharactersCubit(this._charactersRepository) : super(CharactersInitial());
  final CharactersRepository _charactersRepository;
  late List<Character> _allCharacters;
  List<Character> characters = [];
  bool isSearched = false;
  void getCharacters() {
    _charactersRepository.getCharacters().then((value) {
      characters = _allCharacters = value;
      emit(CharactersLoaded());
    });
  }

  void searchByName(String name) {
    characters = _allCharacters
        .where((element) =>
            element.name!.toLowerCase().startsWith(name.toLowerCase()))
        .toList();
    emit(CharactersSearchResult());
  }
  void changeAppBar(){
    isSearched = !isSearched;
    if(!isSearched) characters = _allCharacters;
    emit(CharactersChangeAppBar());
  }
}
