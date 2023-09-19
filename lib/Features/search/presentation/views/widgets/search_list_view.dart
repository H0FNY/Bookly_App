import 'package:bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presention/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
       if(state is SearchSuccess){
         return ListView.builder(
           physics: const BouncingScrollPhysics(),
           shrinkWrap: true,
           padding: EdgeInsets.zero,
           itemCount: state.books.length,
           itemBuilder: (context, index) {
             return  Padding(
               padding: const EdgeInsets.only(bottom: 15.0),
               child: BookListViewItem(book: state.books[index],),
             );
           },
         );
       }
       else if (state is SearchFailure){
         return CustomErrorWidget(errMessage: state.errMessage);
       }
       else {
         return const CustomLoadingIndicator();
       }
      },
    );
  }
}
