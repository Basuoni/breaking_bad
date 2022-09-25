import 'package:breaking_bad/data/models/Character.dart';
import 'package:breaking_bad/shared/components/constants.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Character item;
  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, charactersDetailsScreen,arguments: item);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(3.5),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              item.name!,
              style: const TextStyle(
                height: 1.3,
                fontSize: 14,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Container(
            color: Colors.white,
            child: Hero(
              tag: item.charId.toString(),
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/image_loading.gif',
                image: item.img!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
