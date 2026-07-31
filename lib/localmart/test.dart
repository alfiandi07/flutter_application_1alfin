import 'package:flutter/material.dart';

void main() {
  runApp(const LocalMartApp());
}

class LocalMartApp extends StatelessWidget {
  const LocalMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalMart',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        fontFamily: 'sans-serif',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 16),

            // Banner Carousel
            _buildBannerSection(),
            const SizedBox(height: 24),

            // Kategori Grid
            _buildCategoryGrid(),
            const SizedBox(height: 24),

            // Header Produk Terlaris
            _buildSectionHeader('Produk Terlaris', onSeeAllPressed: () {}),
            const SizedBox(height: 12),

            // List Produk Terlaris Horizontal
            _buildProductList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 1. Top App Bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      titleSpacing: 16,
      title: Row(
        children: [
          const Icon(
            Icons.storefront_rounded,
            color: Color(0xFF0F3995),
            size: 28,
          ),
          const SizedBox(width: 8),
          const Text(
            'LocalMart',
            style: TextStyle(
              color: Color(0xFF0F3995),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF0F3995),
            size: 26,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFF0F3995),
            size: 26,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // 2. Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Cari di LocalMart...',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  // 3. Banner Carousel
  Widget _buildBannerSection() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/400/200?craft'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F3995),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'PROMO UMKM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Diskon 50% Produk Kerajinan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Dukung pengrajin lokal hari ini.',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200/200?plants'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. Kategori Grid Menu
  Widget _buildCategoryGrid() {
    final categories = [
      {'icon': Icons.content_cut, 'title': 'Beauty'},
      {'icon': Icons.checkroom, 'title': 'Fashion'},
      {'icon': Icons.watch_outlined, 'title': 'Aksesori'},
      {'icon': Icons.shopping_basket_outlined, 'title': 'Groceries'},
      {'icon': Icons.single_bed_outlined, 'title': 'Rumah'},
      {'icon': Icons.directions_car_outlined, 'title': 'Mainan'},
      {'icon': Icons.menu_book_outlined, 'title': 'Buku'},
      {'icon': Icons.grid_view_rounded, 'title': 'Lainnya'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // Scroll mengikuti halaman utama
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: const Color(0xFF0F3995),
                  size: 24,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item['title'] as String,
                style: const TextStyle(fontSize: 12, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  // 5. Section Header
  Widget _buildSectionHeader(
    String title, {
    required VoidCallback onSeeAllPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: onSeeAllPressed,
            child: const Text(
              'Lihat Semua',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF0F3995),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 6. Horizontal Product List
  Widget _buildProductList() {
    final products = [
      {'image': 'https://picsum.photos/150/150?serum'},
      {'image': 'https://picsum.photos/150/150?mug'},
      {'image': 'https://picsum.photos/150/150?wallet'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(products[index]['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Color(0xFF0F3995),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 7. Bottom Navigation Bar
  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     currentIndex: _selectedIndex,
  //     onTap: (index) {
  //       setState(() {
  //         _selectedIndex = index;
  //       });
  //     },
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: const Color(0xFF0F3995),
  //     unselectedItemColor: Colors.grey,
  //     selectedLabelStyle: const TextStyle(
  //       fontSize: 11,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     unselectedLabelStyle: const TextStyle(fontSize: 11),
  //     items:
  //         const [
  //               BottomNavigationBarAttributes(
  //                 icon: Icons.home_rounded,
  //                 label: 'Beranda',
  //               ),
  //               BottomNavigationBarAttributes(
  //                 icon: Icons.grid_view_rounded,
  //                 label: 'Kategori',
  //               ),
  //               BottomNavigationBarAttributes(
  //                 icon: Icons.shopping_cart_outlined,
  //                 label: 'Keranjang',
  //               ),
  //               BottomNavigationBarAttributes(
  //                 icon: Icons.assignment_outlined,
  //                 label: 'Pesanan',
  //               ),
  //               // BottomNavigationBarAttributes(
  //               //   icon: Icons.person_outline_rounded,
  //               //   label: 'Profil',
  //               // ),
  //             ]
  //             .map(
  //               (attr) => BottomNavigationBarItem(
  //                 icon: Icon(attr.icon),
  //                 label: attr.label,
  //               ),
  //             )
  //             .toList(),
  //   );
  // }
}

class BottomNavigationBarAttributes {
  final IconData icon;
  final String label;
  const BottomNavigationBarAttributes({
    required this.icon,
    required this.label,
  });
}
