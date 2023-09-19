import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presention/views/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomSearchTextField(),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Result",
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          //child: BookListViewItem(),
          child: Text("data"),
        );
      },
    );
  }
}
