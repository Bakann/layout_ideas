import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:layout_ideas/nav_bar/nav_bar.dart';
import 'package:layout_ideas/product.dart';

/// Shows the product page for a given product ID.
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: ProductDetails(product: product),
    );
  }
}

/// Shows all the product details along with actions to:
/// - leave a review
/// - add to cart
class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Card(
              borderOnForeground: false,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  width: 355,
                  height: 200,
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitHeight,
                ),
              )),
        ),
        const SizedBox(width: 16.0),
        Flexible(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(product.name,
                        style: const TextStyle(
                            fontSize: 15, color: Color(0xFF447880))),
                    const SizedBox(height: 8.0),
                    const Text("Couleur : Anthracite"),
                    // Only show average if there is at least one rating
                    if (product.rating >= 1) ...[
                      const SizedBox(height: 8.0),
                      RatingBar.builder(
                        itemSize: 15,
                        initialRating: product.rating,
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
                    ],
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Text(
                                '${product.price}',
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
                    const SizedBox(height: 8.0),
                    Row(
                      children: const [
                        Text("Livraison GRATUITE",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                fontWeight: FontWeight.w700)),
                        Text(" en France métropolitaine.",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromHeight(47.59)),
                        animationDuration: const Duration(milliseconds: 60),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.amber;
                          }
                          return Colors.amberAccent;
                        }),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        )),
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                            (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.pressed)
                                  ? Colors.green
                                  : Colors.purple;
                          return BorderSide(color: color, width: 1);
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return size 40, otherwise 20
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 17);
                          }
                          return const TextStyle(fontSize: 15);
                        }),
                      ),
                      onPressed: () {},
                      child: const Text('Ajouter au panier'),
                    ),
                    const SizedBox(height: 8.0),
                    // LeaveReviewAction(productId: product.id),
                    const Divider(),
                    const SizedBox(height: 8.0),
                    // AddToCartWidget(product: product),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
