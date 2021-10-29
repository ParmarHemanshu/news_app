part of 'article_list_view_cubit.dart';

@immutable
abstract class ArticleListViewState {}

class ArticleListViewInitial extends ArticleListViewState {

}

class ArticleListViewLoading extends ArticleListViewState{}

class ArticleListViewLoaded extends ArticleListViewState{

  final List<Articles> articles;


  ArticleListViewLoaded(this.articles);
}

class ArticleListViewError extends ArticleListViewState{
  final AlertDialog alertDialog;

  ArticleListViewError(this.alertDialog);
}
