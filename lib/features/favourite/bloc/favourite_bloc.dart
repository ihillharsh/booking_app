import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'favourite_event.dart';
import 'favourite_state.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteInitial()) {
    on<LoadFavourites>(_onLoadFavourites);
  }

  Future<void> _onLoadFavourites(
    LoadFavourites event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(const FavouriteLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    // Mock: Empty favourites for now
    emit(const FavouriteEmpty());
  }
}
