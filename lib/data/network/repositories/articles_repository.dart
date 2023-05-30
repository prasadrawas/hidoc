import 'package:hidoc/data/network/api_client/dio_client.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/model/result/result.dart';
import 'package:hidoc/res/url_constants.dart';
import 'package:hidoc/utils/helper.dart';

class ArticleRepository {
  final DioClient client;
  ArticleRepository(this.client);

  Future<Result<Article>> getArticles(
      {required String sId,
      required String uuId,
      required String userId}) async {
    try {
      final response = await client.post(getArticlesByUid, queryParameters: {
        'sId': sId,
        'uuId': uuId,
        'userId': userId,
      });

      if (response.isSuccess) {
        return Result(data: Article.fromJson(response.data));
      } else {
        return Result(error: response.error);
      }
    } catch (e) {
      printLogValue('getArticlesByUid Error: $e');
      return Result(error: e.toString());
    }
  }
}
