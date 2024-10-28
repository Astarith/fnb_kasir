final List<String> imagepaths = [
  'assets/images/kacang.jpeg',
  'assets/images/kejub.jpg',
  'assets/images/FrenchToast.jpg',
  'assets/images/blb.jpeg',
  'assets/images/blueb.jpeg',
];

final List<String> textpath = [
  'Roti 1',
  'Roti 2',
  'Roti 3',
  'Roti 4',
  'Roti 5',
];

final List<String> hargapath = [
  'Rp10.000',
  'Rp13.000',
  'RP16.000',
  'Rp20.000',
  'Rp18.000'
];

class Product {
  final String imagePath;
  final String textpath;
  final int price;
  int quantity;
  final String notes;

  Product({
    required this.imagePath,
    required this.textpath,
    required this.price,
    this.quantity = 1,
    this.notes = '',
  });
}


