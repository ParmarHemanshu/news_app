import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/repositories/article_repository.dart';


part 'source_list_view_state.dart';

class SourceListViewCubit extends Cubit<ListViewState> {
  final ArticleRepository repository;

  SourceListViewCubit(this.repository) : super(ListViewInitial()) {
    _getDataFromRepo();
  }

  void _getDataFromRepo() async {
    try {
      emit(ListViewLoading());

      final sourceResponse = await repository.dataGetRequest.getAllSources();
      List<Sources>? sourceList = sourceResponse.sources;
      emit(ListViewLoaded(sourceList));
    } catch (e) {
      print(e);
    }
  }
}
