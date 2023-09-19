import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import '../../../../home/data/models/book_model/book_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo,) : super(SearchInitial());
  final SearchRepo searchRepo;
  String search="programming";
  Future<void>fetchBooks() async{
    emit(SearchLoading());
    var result = await searchRepo.fetchBooks(search:search);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
