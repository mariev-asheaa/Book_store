import 'package:bookly_app/presentation/widgets/search_widgets/result_list_view.dart';
import 'package:bookly_app/presentation/widgets/search_widgets/text_field.dart';
import 'package:bookly_app/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helper/styels.dart';


class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(Icons.close,size: 30,)),

          textformfield(
         onchanged: (query) {
           BlocProvider.of<SearchCubit>(context)
               .getSearchedBooks(query: query);
         },
       ),
          const SizedBox(height: 15,),
          const Align(
            alignment: Alignment.centerLeft,
              child:
          Text('Your Search Results',style: Styles.textStyle18,)),
      const SizedBox(height: 25,),
      const Expanded(
      child:ResultListView(),
      )
        ],
      ),
    );
  }
}
