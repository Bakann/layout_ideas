
import 'package:flutter/material.dart';

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.price,
    required this.merchant,
    required this.thumbnail,
  });

  final String title;
  final String price;
  final String merchant;
  final Widget thumbnail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${price}\u{20AC}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffe00034),
                ),
              ),
              Text(
                '$merchant',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              // const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            ],
          ),
        ),
      ],
    );
  }
}

class DealabsCard extends StatelessWidget {
  const DealabsCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.price,
    required this.merchant,
  });

  final Widget thumbnail;
  final String title;
  final String price;
  final String merchant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 72,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: thumbnail,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: _ArticleDescription(
                        thumbnail: thumbnail,
                        title: title,
                        price: price,
                        merchant: merchant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                      child: Text(
                          "Nouveau film Pokémon visionnable gratuitement Bon visionnage et bon weekend à tous :)    Descriptif  Une jeune athlète dont la carrière de coureur semble toucher à sa fin, un menteur invétér…"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    child: Text('A'),
                  ),
                  const Text(
                    '170 Reviews',
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.green[500], size: 15),
                      Icon(Icons.star, color: Colors.green[500], size: 15),
                      Icon(Icons.star, color: Colors.green[500], size: 15),
                      const Icon(Icons.star, color: Colors.black, size: 15),
                      const Icon(Icons.star, color: Colors.black, size: 15),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}