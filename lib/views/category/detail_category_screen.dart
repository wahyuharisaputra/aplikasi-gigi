import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../services/local_storage_service.dart';

class DetailCategoryScreen extends StatefulWidget {
  final CategoryModel category;

  const DetailCategoryScreen({super.key, required this.category});

  @override
  State<DetailCategoryScreen> createState() => _DetailCategoryScreenState();
}

class _DetailCategoryScreenState extends State<DetailCategoryScreen> {
  final LocalStorageService _storageService = LocalStorageService();
  final ScrollController _scrollController = ScrollController();
  
  bool _isFavorite = false;
  double _readingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadData();
    
    // Track reading progress
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        if (maxScroll > 0) {
          final currentScroll = _scrollController.position.pixels;
          final progress = (currentScroll / maxScroll).clamp(0.0, 1.0);
          
          // Only save if progress changed significantly to avoid too many writes
          if ((progress - _readingProgress).abs() > 0.05 || progress == 1.0) {
            setState(() {
              _readingProgress = progress;
            });
            _storageService.saveReadingProgress(widget.category.id, progress);
          }
        }
      }
    });
  }

  Future<void> _loadData() async {
    // Save as last opened
    await _storageService.saveLastOpened(widget.category.id);
    
    // Load favorite status
    final isFav = await _storageService.isFavorite(widget.category.id);
    
    // Load progress
    final progress = await _storageService.getReadingProgress(widget.category.id);
    
    if (mounted) {
      setState(() {
        _isFavorite = isFav;
        _readingProgress = progress;
      });
      
      // Optionally scroll to previous progress
      if (progress > 0 && progress < 1.0) {
        // Delay to allow layout to build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
             final maxScroll = _scrollController.position.maxScrollExtent;
             _scrollController.jumpTo(maxScroll * progress);
          }
        });
      }
    }
  }

  Future<void> _toggleFavorite() async {
    await _storageService.toggleFavorite(widget.category.id);
    setState(() {
      _isFavorite = !_isFavorite;
    });
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFavorite 
          ? '${widget.category.name} ditambahkan ke favorit' 
          : '${widget.category.name} dihapus dari favorit'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            stretch: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: _isFavorite ? Colors.blue[300] : Colors.white,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'category_image_${widget.category.id}',
                    child: Image.network(
                      widget.category.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                          child: Center(
                            child: Hero(
                              tag: 'category_icon_${widget.category.id}',
                              child: Icon(
                                widget.category.icon,
                                size: 100,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Gradient Overlay
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: LinearProgressIndicator(
                value: _readingProgress,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[200]!),
                minHeight: 4,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              transform: Matrix4.translationValues(0, -20, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue[100]!),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[700]),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.category.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[900],
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Content Sections
                    ...widget.category.contentSections.map((section) => Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  section.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            section.content,
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.6,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )),
                    
                    // End of Content Marker
                    if (widget.category.contentSections.isNotEmpty)
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Icon(Icons.check_circle_outline, 
                               size: 48, 
                               color: Colors.green[300]),
                            const SizedBox(height: 8),
                            Text(
                              "Anda telah membaca semua materi!",
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      )
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
