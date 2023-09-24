import "package:flutter/material.dart";
import "package:shoppy_demo/domain/product.dart";
import "package:shoppy_demo/dummy/dummy.dart";

class HomeScreen extends StatefulWidget {
  final int initialCount;
  const HomeScreen({required this.initialCount, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int orderCount = 0;
  late List<Product> products = Dummy.products;

  @override
  void initState() {
    super.initState();
    orderCount = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoppy', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: false,
        actions: [
          Text(
            'Total Order: $orderCount',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blue,
        child: IconButton(
          onPressed: () {
            setState(() {
              orderCount = orderCount + 1;
            });
            print(orderCount);
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildBody() {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              child: Dismissible(
                key: Key(product.id.toString()),
                onDismissed: (direction) {
                  setState(() {
                    orderCount = orderCount + 1;
                  });
                  products.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.title} ordered')));
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.blue,
                  child: const Text(
                    'Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                child: ListTile(
                  leading: Image.network(
                    product.img,
                    cacheHeight: 72,
                    cacheWidth: 72,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.desc),
                  trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('price: ${product.price.toString()}'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'quantity: ${product.quantity.toString()}',
                          style: const TextStyle(color: Colors.black54),
                        )
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
