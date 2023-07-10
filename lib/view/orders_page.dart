import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  final List<Medicine> medicines = [
    Medicine(
      name: 'Paracetamol',
      price: 'Rp 10.000',
      imagePath: 'assets/images/image1.jpg',
    ),
    Medicine(
      name: 'Amoxicillin',
      price: 'Rp 20.000',
      imagePath: 'assets/images/image1.jpg',
    ),
    Medicine(
      name: 'Omeprazole',
      price: 'Rp 15.000',
      imagePath: 'assets/images/image1.jpg',
    ),
    Medicine(
      name: 'Cetirizine',
      price: 'Rp 12.000',
      imagePath: 'assets/images/image1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Silahkan Pilih Item Obat yang Ingin Dipesan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    medicine: medicines[index],
                    onAddToCart: () {
                      // Logika untuk menambahkan ke keranjang
                      // Anda dapat mengakses medicines[index] untuk mendapatkan data obat yang dipilih
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Medicine {
  final String name;
  final String price;
  final String imagePath;

  Medicine({required this.name, required this.price, required this.imagePath});
}

class OrderItem extends StatefulWidget {
  final Medicine medicine;
  final VoidCallback onAddToCart;

  OrderItem({required this.medicine, required this.onAddToCart});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.medicine.imagePath,
            height: 110,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.medicine.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 0.0),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) {
                            _quantity--;
                          }
                        });
                      },
                    ),
                    Text(_quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: widget.onAddToCart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
