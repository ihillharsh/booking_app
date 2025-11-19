import 'package:equatable/equatable.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial();
}

class FavouriteLoading extends FavouriteState {
  const FavouriteLoading();
}

class FavouriteEmpty extends FavouriteState {
  const FavouriteEmpty();
}

class FavouriteLoaded extends FavouriteState {
  final List<String> items;

  const FavouriteLoaded(this.items);

  @override
  List<Object> get props => [items];
}
