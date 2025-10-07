import 'package:flutter/material.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/models/items.dart'; // 👈 import the model file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Dry Prawns";

  // 🧺 Cart data (now stores Items objects)
  List<Items> cart = [];

  // 🐟 Unique categories extracted from the product list
  late final List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = productList.map((e) => e.name).toList();
  }

  void addToCart(Items product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter the selected product from productList
    final selectedProduct =
        productList.firstWhere((item) => item.name == selectedCategory);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nakhawa Dry Fish Store 🐟"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(cart: cart)),
                  );
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: const MyDrawer(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏞️ Hero Banner
            Image.network(
              "https://i.imgur.com/s4JrE7V.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),

            // 🏷️ Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 🛒 Product Display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        selectedProduct.image,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            selectedProduct.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(selectedProduct.desc),
                          Text("₹${selectedProduct.price}/kg"),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () => addToCart(selectedProduct),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(60, 30),
                                ),
                                child: const Text("Add"),
                              ),
                              OutlinedButton(
                                onPressed: () => addToCart(selectedProduct),
                                child: const Text("Buy"),
                              ),
                            ],
                          ),
                        ],
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

// 🧺 CART PAGE — now works with Items model
class CartPage extends StatelessWidget {
  final List<Items> cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    double subtotal = cart.fold(0, (sum, item) => sum + item.price);
    double gst = subtotal * 0.05;
    double total = subtotal + gst;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          leading: Image.asset(item.image),
                          title: Text(item.name),
                          subtitle: Text("₹${item.price}/kg"),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Text("Subtotal: ₹${subtotal.toStringAsFixed(2)}"),
                  Text("GST (5%): ₹${gst.toStringAsFixed(2)}"),
                  Text(
                    "Total: ₹${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
    );
  }
}
