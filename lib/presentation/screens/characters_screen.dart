import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/presentation/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widgets/list_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => CharactersScreenState();
}

class CharactersScreenState extends State<CharactersScreen> {
  static late CharactersCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = CharactersCubit.get(context);
    cubit.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar(cubit: cubit),
        body: buildBlocWidget(state),
      );
    });
  }

  Widget buildBlocWidget(CharactersState state) {
    if (state is CharactersLoaded ||
        state is CharactersChangeAppBar ||
        state is CharactersSearchResult) {
      return buildLoadedWidget();
    } else {
      return Center(
        child: Center(child: Lottie.asset('assets/lottie/loading.json')),
      );
    }
  }

  Widget buildLoadedWidget() => SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: cubit.characters.length,
        itemBuilder: (context, index) =>
            ListItem(item: cubit.characters[index]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 1.4,
        ),
      ));
}
