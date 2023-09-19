import 'package:bookly/Features/home/presention/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_book_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
       if(state is SimilarBooksSuccess){
         return SizedBox(
           height: height / 5.5,
           child: ListView.builder(
             itemCount: state.books.length,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                 return  Padding(
                   padding: const EdgeInsets.only(right: 10.0),
                   child: CustomBookImage(
                     image:
                     state.books[index].volumeInfo.imageLinks?.thumbnail?? "",
                   ),
                 );
               }),
         );
       }
       else if (state is SimilarBooksFailure){
         return CustomErrorWidget(errMessage: state.errMessage);
       }
       else {
         return const CustomLoadingIndicator();
       }
      },
    );
  }
}
