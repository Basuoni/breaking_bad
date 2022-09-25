import 'package:breaking_bad/data/models/Character.dart';
import 'package:flutter/material.dart';

import '../../shared/style/colors.dart';

class CharactersDetailsScreen extends StatelessWidget {
  Character character;
  CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 600.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: character.charId!.toString(),
                child: Image.network(
                  character.img!,
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
              title: Text(
                character.nickname!,
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: buildColumnDetails(character),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  List<Widget> buildColumnDetails(Character character) => [
        buildItem('Name: ', character.name!),
        buildItem('Birthday: ', character.birthday!),
        buildItem('Job: ', character.occupation!.join(', ')),
        buildItem('Status: ', character.status!),
        buildItem('Seasons: ', character.appearance!.join(', ')),
        buildItem('Portrayed: ', character.portrayed!),
        buildItem('Category: ', character.category!),
        (character.betterCallSaulAppearance!.isEmpty
            ? Container()
            : buildItem('Better call saul appearance: ',
                character.betterCallSaulAppearance!.join(', '))),
      ];

  buildItem(String title, String body) => Column(
    children: [
      Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: Text(
            body,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey[800],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Container(
        color: MColor.main,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        height: 1.2,
      ),
      const SizedBox(
        height: 15.0,
      ),
    ],
  );
}
