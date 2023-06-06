class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});
}

class ImageProvider {
  List<ImageModel> images = [
    ImageModel(imageUrl: 'https://example.com/image1.jpg'),
    ImageModel(imageUrl: 'https://example.com/image2.jpg'),
    ImageModel(imageUrl: 'https://example.com/image3.jpg'),
    // Tambahkan lebih banyak gambar jika diperlukan
  ];
}