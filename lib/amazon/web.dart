import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.price,
    required this.merchant,
    required this.initialRating,
    required this.reviews,
  });

  final String title;
  final String price;
  final String merchant;
  final double initialRating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  'Windows XP',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("$initialRating",
                        style: const TextStyle(
                            color: Color(0xFF007185),
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(width: 3),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: initialRating,
                      // minRating: 1.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(width: 3),
                    Text("($reviews)",
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          child: Text(
                            '${price}',
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Positioned(
                          top: 3,
                          right: -6,
                          child: Text(
                            '\u{20AC}',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                    "Recevez-le entre le mardi 28 mars et le jeudi 30 mars",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Color(0xFF067D62),
                      size: 20,
                    ),
                    SizedBox(width: 3),
                    Text("Déjà acheté",
                        style: TextStyle(
                            color: Color(0xFF067D62),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                // const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AmazonCard extends StatelessWidget {
  const AmazonCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.price,
    required this.merchant,
    required this.rating,
    required this.reviews,
    required this.onPressed,
  });

  final Widget thumbnail;
  final String title;
  final String price;
  final double rating;
  final String merchant;
  final int reviews;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        // elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // for round corner on image left side
        child: Column(
          children: [
            SizedBox(
              height: 188.547,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: SizedBox(
                        width: 152.414,
                        child: AspectRatio(
                          aspectRatio: 21 / 34,
                          child: thumbnail,
                        ),
                      ),
                    ),
                    Expanded(
                      child: _ArticleDescription(
                        title: title,
                        price: price,
                        merchant: merchant,
                        initialRating: rating,
                        reviews: reviews,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
