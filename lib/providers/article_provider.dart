import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../data/dummy_articles.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  bool _isLoading = false;

  List<Article> get articles => _filteredArticles;
  bool get isLoading => _isLoading;

  ArticleProvider() {
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    _articles = dummyArticlesData.map((e) => Article.fromJson(e)).toList();
    _filteredArticles = _articles;
    
    _isLoading = false;
    notifyListeners();
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      _filteredArticles = _articles;
    } else {
      _filteredArticles = _articles
          .where((article) =>
              article.title.toLowerCase().contains(query.toLowerCase()) ||
              article.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterByCategory(String category) {
    if (category.isEmpty) {
      _filteredArticles = _articles;
    } else {
      _filteredArticles = _articles
          .where((article) => article.category == category)
          .toList();
    }
    notifyListeners();
  }

  void toggleBookmark(int id) {
    final index = _articles.indexWhere((element) => element.id == id);
    if (index >= 0) {
      _articles[index].isBookmarked = !_articles[index].isBookmarked;
      notifyListeners();
    }
  }

  List<Article> get bookmarkedArticles {
    return _articles.where((element) => element.isBookmarked).toList();
  }
}
