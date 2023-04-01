class Product {

  const Product({
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  final int id;
  final bool isFeatured;
  final String name;
  final int price;
  final int reviews;
  final double rating;


  String get assetName => '$id-0.jpg';

  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}

class ProductsRepository {
  static List<Product> loadProducts() {
    const allProducts = <Product>[
      Product(
        id: 0,
        isFeatured: true,
        name:
            'PC Portable 14" Asus Zenbook UM425QA-KI194W - Full HD IPS Anti-reflets, Ryzen 5 5600H, Vega 7, 16 Go de RAM, 512 Go SSD, Windows 11',
        price: 120,
        rating: 1.5,
        reviews: 113,
      ),
      Product(
        id: 1,
        isFeatured: true,
        name: 'Console Nintendo Switch Rouge + Code de téléchargement Super Mario Odyssey (+30€ offerts en bon d\'achat)',
        price: 58,
        rating: 0,
        reviews: 113,
      ),
      Product(
        id: 2,
        isFeatured: false,
        name: '[Sous conditions] 5€ de remise dès 20€ d\'achats en créant une liste d\'envie',
        price: 35,
        rating: 3.5,
        reviews: 113,
      ),
      Product(
        id: 3,
        isFeatured: true,
        name: 'Sélection de Lingerie Sexy 1969 - Ex: Combinaison pour femmes BodyStocking taille unique',
        price: 98,
        rating: 2,
        reviews: 113,
      ),
      Product(
        id: 4,
        isFeatured: false,
        name: 'Lego Art Hokusaï (31208) - La Grande Vague d\'Hokusai',
        price: 34,
        rating: 4.5,
        reviews: 113,
      ),
      Product(
        id: 5,
        isFeatured: false,
        name: '[Santé] Le remboursement des protections périodiques pour les moins de 25 ans',
        price: 12,
        rating: 5,
        reviews: 113,
      ),
      Product(
        id: 6,
        isFeatured: false,
        name: 'TV 65" Hisense 65U8HQ - Miniled QLED, 100 Hz, IMAX Enhanced, HDMI 2.1, FreeSync Premium, Son 2.1.2 70W Dolby Atmos (via ODR 300€)',
        price: 16,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 7,
        isFeatured: true,
        name: 'Console Nintendo Switch OLED avec paire de Joy-Con + jeu The Legend of Zelda Skyward Sword offert',
        price: 40,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 8,
        isFeatured: true,
        name: '70% de réduction sur les vestes sans manches - Ex: Blouson léger à col montant, différents coloris et tailles disponibles',
        price: 198,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 9,
        isFeatured: true,
        name: '[Adhérents Fnac] 10€ crédités sur votre compte fidélité par tranche de 100€ d\'achat sur tout le site (hors exclusions)',
        price: 58,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 10,
        isFeatured: false,
        name: 'Copper wire rack',
        price: 18,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 11,
        isFeatured: false,
        name: 'Soothe ceramic set',
        price: 28,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 12,
        isFeatured: false,
        name: 'Hurrahs tea set',
        price: 34,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 13,
        isFeatured: true,
        name: 'Blue stone mug',
        price: 18,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 14,
        isFeatured: true,
        name: 'Rainwater tray',
        price: 27,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 15,
        isFeatured: true,
        name: 'Chambray napkins',
        price: 16,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 16,
        isFeatured: true,
        name: 'Succulent planters',
        price: 16,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 17,
        isFeatured: false,
        name: 'Quartet table',
        price: 175,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 18,
        isFeatured: true,
        name: 'Kitchen quattro',
        price: 129,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 19,
        isFeatured: false,
        name: 'Clay sweater',
        price: 48,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 20,
        isFeatured: false,
        name: 'Sea tunic',
        price: 45,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 21,
        isFeatured: false,
        name: 'Plaster tunic',
        price: 38,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 22,
        isFeatured: false,
        name: 'White pinstripe shirt',
        price: 70,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 23,
        isFeatured: false,
        name: 'Chambray shirt',
        price: 70,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 24,
        isFeatured: true,
        name: 'Seabreeze sweater',
        price: 60,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 25,
        isFeatured: false,
        name: 'Gentry jacket',
        price: 178,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 26,
        isFeatured: false,
        name: 'Navy trousers',
        price: 74,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 27,
        isFeatured: true,
        name: 'Walter henley (white)',
        price: 38,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 28,
        isFeatured: true,
        name: 'Surf and perf shirt',
        price: 48,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 29,
        isFeatured: true,
        name: 'Ginger scarf',
        price: 98,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 30,
        isFeatured: true,
        name: 'Ramona crossover',
        price: 68,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 31,
        isFeatured: false,
        name: 'Chambray shirt',
        price: 38,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 32,
        isFeatured: false,
        name: 'Classic white collar',
        price: 58,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 33,
        isFeatured: true,
        name: 'Cerise scallop tee',
        price: 42,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 34,
        isFeatured: false,
        name: 'Shoulder rolls tee',
        price: 27,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 35,
        isFeatured: false,
        name: 'Grey slouch tank',
        price: 24,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 36,
        isFeatured: false,
        name: 'Sunshirt dress',
        price: 58,
        rating: 1,
        reviews: 113,
      ),
      Product(
        id: 37,
        isFeatured: true,
        name: 'Fine lines tee',
        price: 58,
        rating: 1,
        reviews: 113,
      ),
    ];
    return allProducts;
  }
}
