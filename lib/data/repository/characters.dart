import 'package:breaking_bad/data/api/breaking_bad_api.dart';
import 'package:breaking_bad/data/models/Character.dart';

class CharactersRepository {
  late final ApiServices  _apiServices;

  CharactersRepository(this._apiServices);

  Future<List<Character>> getCharacters() async {
    final characters = await _apiServices.getCharacters();
    return characters.map((e) => Character.fromJson(e)).toList();
  }
}