import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../manger/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  FocusNode focus = FocusNode();
  String? searchValue="programming";
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focus,
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      onChanged: (value){
        searchValue=value;
        BlocProvider.of<SearchCubit>(context).search=value;
        BlocProvider.of<SearchCubit>(context).fetchBooks();
      },
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Opacity(
            opacity: .6,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<SearchCubit>(context).search=searchValue!;
                BlocProvider.of<SearchCubit>(context).fetchBooks();
              },
              icon:  Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: focus.hasFocus ? Colors.white: Colors.white,
                size: 22,
              ),
            )),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white54,
      ),
    );
  }
}
