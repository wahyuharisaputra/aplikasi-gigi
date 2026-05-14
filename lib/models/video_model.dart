class VideoModel {
  final int id;
  final String title;
  final String description;
  final String youtubeId;
  final String duration;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.youtubeId,
    required this.duration,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['judul'],
      description: json['deskripsi'],
      youtubeId: json['youtubeId'],
      duration: json['durasi'],
    );
  }
}
