class Items {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}

// Sample product list
final List<Items> productList = [
  Items(
    id: '1',
    name: 'Dry Prawns',
    desc: 'High-quality sun-dried prawns, rich in flavor and perfect for curries.',
    price: 450,
    color: '#F5D0A9',
    image: 'assets/images/dry_prawns.png',
  ),
  Items(
    id: '2',
    name: 'Dry Bombay Duck',
    desc: 'Crispy and tasty dried Bombay Duck, ideal for frying or chutneys.',
    price: 380,
    color: '#F7BE81',
    image: 'assets/images/dry_bombay_duck.png',
  ),
  Items(
    id: '3',
    name: 'Dry Pomfret',
    desc: 'Premium dry pomfret with authentic coastal flavor.',
    price: 600,
    color: '#F3E2A9',
    image: 'assets/images/dry_pomfret.png',
  ),
  Items(
    id: '4',
    name: 'Sukat',
    desc: 'Tiny dried shrimp commonly used in Maharashtrian and Goan dishes.',
    price: 250,
    color: '#F6CECE',
    image: 'assets/images/sukat.png',
  ),
  Items(
    id: '5',
    name: 'Karandi',
    desc: 'Freshly dried karandi, great for traditional seafood curries.',
    price: 300,
    color: '#F5DA81',
    image: 'assets/images/karandi.png',
  ),
  Items(
    id: '6',
    name: 'Dry Mandli',
    desc: 'Delicious dried mandli fish, perfect for frying or masala curry.',
    price: 280,
    color: '#F7D358',
    image: 'assets/images/dry_mandli.png',
  ),
];
