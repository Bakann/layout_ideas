import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layout_ideas/amazon/web.dart';
import 'package:layout_ideas/dealabs/web.dart';
import 'package:layout_ideas/product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.products});

  final String title;
  final List<Product> products;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () => context.push("/login"),
              child: Text("Se connecter",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
            ),
          ),
          Switch(
            // This bool value toggles the switch.
            value: light,
            activeColor: Colors.red,
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                light = value;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              var image = Image.asset(
                widget.products[index].assetName,
                package: widget.products[index].assetPackage,
                fit: BoxFit.fitHeight,
              );
              return light
                  ? DealabsCard(
                      thumbnail: image,
                      title: widget.products[index].name,
                      price: widget.products[index].price.toString(),
                      merchant: 'Amazon')
                  : AmazonCard(
                      thumbnail: image,
                      title: widget.products[index].name,
                      price: widget.products[index].price.toString(),
                      merchant: 'Amazon',
                      rating: widget.products[index].rating,
                      reviews: widget.products[index].reviews,
                      onPressed: () => context.push("/product",
                          extra: widget.products[index]),
                    );
            }),
      ),
    );
  }
}
