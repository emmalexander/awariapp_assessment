import 'package:flutter/material.dart';
import '../../models/product.dart';

class CartItem {
  final Product product;
  final String size;
  int quantity;

  CartItem({
    required this.product,
    required this.size,
    this.quantity = 1,
  });
}

class AppState extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Satin Slip Dress',
      price: 97.0,
      description: 'Celebrate elegance and fluidity with this satin slip dress. Styled with a delicate cowl neckline and adjustable thin straps, it is cut on the bias to drape beautifully over the silhouette for effortless glamour.',
      category: 'Trending',
      imageUrl: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1496747611176-843222e1e57c?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1566174053879-31528523f8ae?q=80&w=800&auto=format&fit=crop',
      ],
    ),
    Product(
      id: '2',
      name: 'Pleated Midi Dress',
      price: 68.0,
      description: 'A versatile accordion-pleated midi dress, featuring a sophisticated high neck and a self-tie waist belt. Perfect for transitioning from daytime office meetings to weekend social outings.',
      category: 'Trending',
      imageUrl: 'https://images.unsplash.com/photo-1585487000160-6ebcfceb0d03?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1585487000160-6ebcfceb0d03?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1485968579580-b6d095142e6e?q=80&w=800&auto=format&fit=crop',
      ],
    ),
    Product(
      id: '3',
      name: 'Floral Summer Dress',
      price: 42.0,
      description: 'Keep it bright and airy with this lightweight floral print cotton dress. Designed with a tiered skirt, smocked back panel, and puff sleeves for a charming, sun-kissed aesthetic.',
      category: 'Summer',
      imageUrl: 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=800&auto=format&fit=crop',
      ],
    ),
    Product(
      id: '4',
      name: 'Velvet Evening Gown',
      price: 94.0,
      description: 'Turn heads in this majestic floor-length velvet gown. It features a daring thigh-high slit, an off-the-shoulder sweetheart neckline, and a structured bodice to ensure a perfect fit.',
      category: 'Evening',
      imageUrl: 'https://images.unsplash.com/photo-1612336307429-8a898d10e223?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1612336307429-8a898d10e223?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1539008885759-47cf3a90302b?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1518831959646-742c3a14ebf7?q=80&w=800&auto=format&fit=crop',
      ],
    ),
    Product(
      id: '5',
      name: 'Lace Cocktail Dress',
      price: 85.0,
      description: 'Exquisite floral lace overlays a contrast lining, creating a dramatic visual texture. This cocktail dress offers a slim fit, sheer long sleeves, and a scalloped hemline.',
      category: 'Evening',
      imageUrl: 'https://images.unsplash.com/photo-1596783074918-c84cb06531ca?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1596783074918-c84cb06531ca?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1621184455862-c163dfb30e0f?q=80&w=800&auto=format&fit=crop',
      ],
    ),
    Product(
      id: '6',
      name: 'Linen Wrap Dress',
      price: 55.0,
      description: 'Crafted from pure European linen, this wrap dress keeps you cool and polished. Features a functional wrap design with a side tie, an asymmetric collar, and short cuffed sleeves.',
      category: 'Casual',
      imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=800&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=800&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?q=80&w=800&auto=format&fit=crop',
      ],
    ),
  ];

  final Set<String> _favorites = {'4'};
  final List<CartItem> _cart = [];
  String _selectedCategory = 'Trending';
  String _searchQuery = '';

  List<Product> get products => _products;
  Set<String> get favorites => _favorites;
  List<CartItem> get cart => _cart;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  int get cartCount => _cart.fold(0, (sum, item) => sum + item.quantity);

  List<Product> get filteredProducts {
    return _products.where((product) {
      final matchesCategory = _selectedCategory == 'Trending' ||
          product.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void toggleFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(String id) => _favorites.contains(id);

  void addToCart(Product product, String size) {
    final existingIndex = _cart.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );
    if (existingIndex >= 0) {
      _cart[existingIndex].quantity += 1;
    } else {
      _cart.add(CartItem(product: product, size: size));
    }
    notifyListeners();
  }

  void removeFromCart(Product product, String size) {
    final index = _cart.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );
    if (index >= 0) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity -= 1;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}

class AppStateProvider extends InheritedWidget {
  final AppState state;

  const AppStateProvider({
    super.key,
    required this.state,
    required super.child,
  });

  static AppState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!.state;
    } else {
      final element = context.getElementForInheritedWidgetOfExactType<AppStateProvider>();
      return (element?.widget as AppStateProvider).state;
    }
  }

  @override
  bool updateShouldNotify(AppStateProvider oldWidget) {
    return state != oldWidget.state;
  }
}
