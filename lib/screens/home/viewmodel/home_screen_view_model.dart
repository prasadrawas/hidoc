import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hidoc/data/network/repositories/articles_repository.dart';
import 'package:hidoc/model/article/article.dart';
import 'package:hidoc/utils/helper.dart';

import '../../../utils/base/base_model.dart';

class HomeScreenViewModel extends BaseModel {
  final ArticleRepository repository;
  HomeScreenViewModel(this.repository);

  Article? get article => _article;
  Article? _article;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getArticles(BuildContext context) async {
    setLoading(true);
    final response =
        await repository.getArticles(sId: '500', uuId: '', userId: '423914');
    setLoading(false);
    if (response.isSuccess) {
      _article = response.data;
    } else {
      // ignore: use_build_context_synchronously
      showErrorSnackBar(context, response.error ?? 'something went wrong');
    }
  }

  void clear() {
    _article = null;
    _isLoading = false;
    notifyListeners();
  }
}
