import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../data/dummy_videos.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> _videos = [];
  bool _isLoading = false;

  List<VideoModel> get videos => _videos;
  bool get isLoading => _isLoading;

  VideoProvider() {
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));
    
    _videos = dummyVideosData.map((e) => VideoModel.fromJson(e)).toList();
    
    _isLoading = false;
    notifyListeners();
  }
}
