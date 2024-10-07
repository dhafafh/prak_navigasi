import 'package:flutter/material.dart';
import 'package:prak_navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sugar',
        price: 5000,
        imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2015/09/02/0304cf7b-5d92-4636-8ccc-8fe21e13f881.jpg?w=600&q=90',
        stock: 20,
        rating: 4.5,
      ),
      Item(
        name: 'Baby Oil',
        price: 18000,
        imageUrl: 'https://res-5.cloudinary.com/dk0z4ums3/image/upload/c_scale,h_500,w_500/v1/production/pharmacy/products/1660970003_61e8e4b4f2c0e805af9db9bf',
        stock: 500,
        rating: 5.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom
          childAspectRatio: 0.7, // Rasio lebar terhadap tinggi
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Hero(
              tag: item.name, // Tag yang unik untuk animasi Hero
              child: Card(
                child: Column(
                  children: [
                    Expanded( // Menggunakan Expanded agar gambar mengambil ruang yang tepat
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Memberikan padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4), // Jarak antara nama dan harga
                          Text('Rp ${item.price}', style: TextStyle(color: Colors.green)),
                          SizedBox(height: 4), // Jarak antara harga dan stok
                          Text('Stock: ${item.stock}'),
                          SizedBox(height: 4), // Jarak antara stok dan rating
                          Text('Rating: ${item.rating}', style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Tambahkan footer jika perlu
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text('Nama: Dhafa Firjatullah Hikmal, NIM: 362358302074'),
      ),
    );
  }
}