import 'package:flutter/material.dart';

void main() => runApp(const MarketApp());

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Маркет',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Тестовые данные — потом заменим на реальные магазины
  final shops = const [
    {'name': 'Одежда Pro', 'logo': '👗', 'desc': 'Одежда и обувь'},
    {'name': 'ТехноМир', 'logo': '📱', 'desc': 'Гаджеты и техника'},
    {'name': 'Дом и Сад', 'logo': '🌱', 'desc': 'Товары для дома'},
    {'name': 'Красота', 'logo': '💄', 'desc': 'Косметика'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Маркет')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск магазинов',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final shop = shops[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // Сюда потом добавим переход в каталог магазина
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(shop['logo']!, style: const TextStyle(fontSize: 40)),
                        const SizedBox(height: 8),
                        Text(shop['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(shop['desc']!,
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Магазины'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Заказы'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
