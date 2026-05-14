import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/video_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // HTML dengan YouTube embed yang akan diload di WebView
    final String youtubeEmbedHtml = '''
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
      * { margin: 0; padding: 0; box-sizing: border-box; }
      body { background: #000; }
      .video-container {
        position: relative;
        width: 100%;
        padding-bottom: 56.25%;
        height: 0;
        overflow: hidden;
      }
      .video-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border: 0;
      }
    </style>
  </head>
  <body>
    <div class="video-container">
      <iframe
        src="https://www.youtube.com/embed/${widget.video.youtubeId}?autoplay=1&rel=0&playsinline=1&enablejsapi=1"
        allow="autoplay; fullscreen; accelerometer; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen>
      </iframe>
    </div>
  </body>
</html>
''';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) setState(() => _isLoading = false);
          },
          onWebResourceError: (error) {
            if (mounted) setState(() => _isLoading = false);
          },
        ),
      )
      ..loadHtmlString(youtubeEmbedHtml, baseUrl: 'https://www.youtube.com');
  }

  Future<void> _openInYoutubeApp() async {
    final uri = Uri.parse(
      'https://www.youtube.com/watch?v=${widget.video.youtubeId}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        title: Text(
          widget.video.title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: _openInYoutubeApp,
            icon: const Icon(Icons.open_in_new, color: Colors.white70),
            tooltip: 'Buka di YouTube',
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          // WebView area dengan YouTube embed
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  Container(
                    color: Colors.black,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.red),
                          SizedBox(height: 12),
                          Text(
                            'Memuat video...',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Info Video
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.video.duration,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 12),
                    Text(
                      widget.video.description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF475569),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tombol cadangan buka di YouTube App
                    OutlinedButton.icon(
                      onPressed: _openInYoutubeApp,
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Buka di Aplikasi YouTube'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
