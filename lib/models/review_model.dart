//영화 리뷰 리스트 모델

class Review {
  final String id;
  final String author;
  final String content;
  final DateTime? createdAt;
  final double? rating;

  Review({
    required this.id,
    required this.author,
    required this.content,
    this.createdAt,
    this.rating,
  });

  Review.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        author = json['author'] ?? json['username'] ?? '익명',
        content = json['content'] ?? '',
        createdAt = json['created_at'] != null
            ? _parseDateTime(json['created_at'])
            : null,
        rating = json['author_details'] != null &&
                json['author_details']['rating'] != null
            ? (json['author_details']['rating'] as num).toDouble()
            : null;

  static DateTime? _parseDateTime(String dateStr) {
    // UTC 문자열 제거 후 파싱
    String cleanDateStr = dateStr.replaceAll(' UTC', '');
    return DateTime.parse(cleanDateStr);
  }

  String get formattedDate {
    if (createdAt == null) return '';
    return '${createdAt!.year}년 ${createdAt!.month}월 ${createdAt!.day}일';
  }

  String get formattedRating {
    if (rating == null) return '평가없음';
    return rating!.toStringAsFixed(1);
  }
}
