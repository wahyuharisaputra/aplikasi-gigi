class Article {
  final int id;
  final String title;
  final String category;
  final String imageUrl;
  final String summary;
  final String content;
  final String date;
  final String url;
  bool isBookmarked;

  Article({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.summary,
    required this.content,
    required this.date,
    this.url = '',
    this.isBookmarked = false,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['judul'],
      category: json['kategori'],
      imageUrl: json['gambar'],
      summary: json['ringkasan'] ?? '',
      content: json['konten'] ?? '',
      date: json['tanggal'] ?? 'Hari ini',
      url: json['url'] ?? '',
    );
  }
}
