import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/article_repository.dart';

part 'article_list_view_state.dart';

class ArticleListViewCubit extends Cubit<ArticleListViewState> {
  final ArticleRepository repository;

  ArticleListViewCubit(this.repository) : super(ArticleListViewInitial()) {
    _getDataFromRepo();
  }

  void _getDataFromRepo() async {
    try {
      emit(ArticleListViewLoading());

      final articleResponse = await repository.dataGetRequest.getArticlesOfSource();
      List<Articles>? articleList = articleResponse.articles;
      emit(ArticleListViewLoaded(articleList));
    } catch (e) {
      print(e);
    }
  }
}
