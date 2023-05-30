class Article {
  final int? success;
  final String? message;
  final Data? data;
  final DateTime? timestamp;

  Article({
    this.success,
    this.message,
    this.data,
    this.timestamp,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        success: json['success'],
        message: json['message'],
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp']),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
        'timestamp': timestamp?.toIso8601String(),
      };
}

class Data {
  final List<News>? news;
  final List<ArticleClass>? trandingBulletin;
  final String? specialityName;
  final List<ArticleClass>? latestArticle;
  final List<ArticleClass>? exploreArticle;
  final List<ArticleClass>? trandingArticle;
  final ArticleClass? article;
  final List<ArticleClass>? bulletin;
  final int? sId;

  Data({
    this.news,
    this.trandingBulletin,
    this.specialityName,
    this.latestArticle,
    this.exploreArticle,
    this.trandingArticle,
    this.article,
    this.bulletin,
    this.sId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        news: json['news'] == null
            ? []
            : List<News>.from(json['news']!.map((x) => News.fromJson(x))),
        trandingBulletin: json['trandingBulletin'] == null
            ? []
            : List<ArticleClass>.from(
                json['trandingBulletin']!.map((x) => ArticleClass.fromJson(x))),
        specialityName: json['specialityName'],
        latestArticle: json['latestArticle'] == null
            ? []
            : List<ArticleClass>.from(json['latestArticle']!.map((x) => x)),
        exploreArticle: json['exploreArticle'] == null
            ? []
            : List<ArticleClass>.from(
                json['exploreArticle']!.map((x) => ArticleClass.fromJson(x))),
        trandingArticle: json['trandingArticle'] == null
            ? []
            : List<ArticleClass>.from(
                json['trandingArticle']!.map((x) => ArticleClass.fromJson(x))),
        article: json['article'] == null
            ? null
            : ArticleClass.fromJson(json['article']),
        bulletin: json['bulletin'] == null
            ? []
            : List<ArticleClass>.from(
                json['bulletin']!.map((x) => ArticleClass.fromJson(x))),
        sId: json['sId'],
      );

  Map<String, dynamic> toJson() => {
        'news': news == null
            ? []
            : List<dynamic>.from(news!.map((x) => x.toJson())),
        'trandingBulletin': trandingBulletin == null
            ? []
            : List<dynamic>.from(trandingBulletin!.map((x) => x.toJson())),
        'specialityName': specialityName,
        'latestArticle': latestArticle == null
            ? []
            : List<dynamic>.from(latestArticle!.map((x) => x)),
        'exploreArticle': exploreArticle == null
            ? []
            : List<dynamic>.from(exploreArticle!.map((x) => x.toJson())),
        'trandingArticle': trandingArticle == null
            ? []
            : List<dynamic>.from(trandingArticle!.map((x) => x.toJson())),
        'article': article?.toJson(),
        'bulletin': bulletin == null
            ? []
            : List<dynamic>.from(bulletin!.map((x) => x.toJson())),
        'sId': sId,
      };
}

class ArticleClass {
  final int? id;
  final String? articleTitle;
  final String? redirectLink;
  final String? articleImg;
  final String? articleDescription;
  final String? specialityId;
  final int? rewardPoints;
  final String? keywordsList;
  final String? articleUniqueId;
  final int? articleType;
  final DateTime? createdAt;

  ArticleClass({
    this.id,
    this.articleTitle,
    this.redirectLink,
    this.articleImg,
    this.articleDescription,
    this.specialityId,
    this.rewardPoints,
    this.keywordsList,
    this.articleUniqueId,
    this.articleType,
    this.createdAt,
  });

  factory ArticleClass.fromJson(Map<String, dynamic> json) => ArticleClass(
        id: json['id'],
        articleTitle: json['articleTitle'],
        redirectLink: json['redirectLink'],
        articleImg: json['articleImg'],
        articleDescription: json['articleDescription'],
        specialityId: json['specialityId'],
        rewardPoints: json['rewardPoints'],
        keywordsList: json['keywordsList'],
        articleUniqueId: json['articleUniqueId'],
        articleType: json['articleType'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'articleTitle': articleTitle,
        'redirectLink': redirectLink,
        'articleImg': articleImg,
        'articleDescription': articleDescription,
        'specialityId': specialityId,
        'rewardPoints': rewardPoints,
        'keywordsList': keywordsList,
        'articleUniqueId': articleUniqueId,
        'articleType': articleType,
        'createdAt': createdAt?.toIso8601String(),
      };
}

class News {
  final int? id;
  final String? title;
  final String? url;
  final String? urlToImage;
  final String? description;
  final String? speciality;
  final String? newsUniqueId;
  final int? trendingLatest;
  final DateTime? publishedAt;

  News({
    this.id,
    this.title,
    this.url,
    this.urlToImage,
    this.description,
    this.speciality,
    this.newsUniqueId,
    this.trendingLatest,
    this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        description: json['description'],
        speciality: json['speciality'],
        newsUniqueId: json['newsUniqueId'],
        trendingLatest: json['trendingLatest'],
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'urlToImage': urlToImage,
        'description': description,
        'speciality': speciality,
        'newsUniqueId': newsUniqueId,
        'trendingLatest': trendingLatest,
        'publishedAt': publishedAt?.toIso8601String(),
      };
}
