final List<String> imagepaths = [
  'assets/images/kacang.jpeg',
  'assets/images/kejub.jpg',
  'assets/images/FrenchToast.jpg',
  'assets/images/blb.jpeg',
  'assets/images/blueb.jpeg',
  'assets/images/icelemon.jpg',
  'assets/images/lemon.jpeg',
];

final List<String> textpath = [
  'Peanut Toast',
  'Cheese Toast',
  'Roti 2',
  'Blueberry Toast',
  'Roti 4',
  'Minuman1',
  'Minuman2',
];

final List<String> name = [
  'Peanut Toast',
  'Cheese Toast',
  'Roti 2',
  'Blueberry Toast',
  'Roti 4',
  'Minuman1',
  'Minuman2',
];

final List<String> hargapath = [
  'Rp10.000',
  'Rp13.000',
  'RP16.000',
  'Rp20.000',
  'Rp18.000',
  'Rp10.000',
  'Rp15.000',
];

class Product {
  final String name;
  final String imagePath;
  final String textpath;
  final int price;
  int quantity;
  final String notes;

  Product({
    this.name = '',
    required this.imagePath,
    required this.textpath,
    required this.price,
    this.quantity = 1,
    this.notes = '',
  });
}
class Transaction {
  String tanggal;
  String waktu;
  int items;
  int harga;

  Transaction({
    required this.tanggal,
    required this.waktu,
    required this.items,
    required this.harga,
  });
}