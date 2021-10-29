part of 'source_list_view_cubit.dart';

@immutable
abstract class ListViewState {}

class ListViewInitial extends ListViewState {}

class ListViewLoading extends ListViewState{}

class ListViewLoaded extends ListViewState{

  final List<Sources> sources;


  ListViewLoaded(this.sources);
}

class ListViewError extends ListViewState{
  final AlertDialog alertDialog;

  ListViewError(this.alertDialog);
}
