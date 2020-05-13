class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.channelTitle
  
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['id'],
      title: snippet['snippet']['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}