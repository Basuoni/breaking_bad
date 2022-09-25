import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/models/Character.dart';
import 'package:breaking_bad/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/api/breaking_bad_api.dart';
import 'data/repository/characters.dart';
import 'shared/components/constants.dart';

class AppRouter {
  late CharactersRepository _charactersRepository;
  late CharactersCubit _charactersCubit;

  AppRouter() {
    _charactersRepository = CharactersRepository(ApiServices());
    _charactersCubit = CharactersCubit(_charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => _charactersCubit,
              child: const CharactersScreen(),
            ));
      case charactersDetailsScreen:
        final Character character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(character: character,));
    }
    return null;
  }
}
