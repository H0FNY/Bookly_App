import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestbooksCubit extends Cubit<NewestBooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void>fetchNewsetBooks() async{
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
