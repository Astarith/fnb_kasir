import 'package:flutter/material.dart';
import 'package:fnb_kasir/provider/product.dart';

class OrderProvider with ChangeNotifier {
  final List<Product> _orderItems = [];
  final List<Product> _total = [];

  List<Product> get orderItems => _orderItems;
  List<Product> get products => _total;

  int get totalItems => _orderItems.fold(0, (sum, item) => sum + item.quantity); // Hitung total item
  int get totalPrice => _orderItems.fold(0, (sum, item) => sum + (item.price * item.quantity)); // Hitung total harga


  // Tambahkan produk ke daftar order
  void addProduct(Product product) {
    // Jika produk sudah ada di order, tambah jumlahnya
    int index = _orderItems.indexWhere((item) => item.textpath == product.textpath);
    if (index != -1) {
      _orderItems[index].quantity += 1;
    } else {
      _orderItems.add(product);
    }
    notifyListeners();
  }

  // Hapus produk dari daftar order
  void removeProduct(Product product) {
    _orderItems.removeWhere((item) => item.textpath == product.textpath);
    notifyListeners();
  }

  // Kurangi jumlah produk
  void decreaseQuantity(Product product) {
    int index = _orderItems.indexWhere((item) => item.textpath == product.textpath);
    if (index != -1) {
      if (_orderItems[index].quantity > 1) {
        _orderItems[index].quantity -= 1;
      } else {
        _orderItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Bersihkan semua order
  void clearOrder() {
    _orderItems.clear();
    notifyListeners();
  }

  void additem(Product product) {
    _total.add(product);
    notifyListeners(); // Pemberitahuan untuk update UI
  }
}