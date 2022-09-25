import 'dart:developer';

import 'package:flutter/material.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../shared/style/colors.dart';

PreferredSizeWidget buildAppBar({
  required CharactersCubit cubit,
}) {
  return cubit.isSearched
      ? AppBar(
          backgroundColor: MColor.main,
          title: TextField(
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
                hintText: 'Find a charecter...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
            onChanged: (value) {
              cubit.searchByName(value);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  cubit.changeAppBar();
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.red[300],
                ))
          ],
        )
      : AppBar(
          backgroundColor: MColor.main,
          title: const Text(
            'Breaking Bad',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                cubit.changeAppBar();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        );
}
