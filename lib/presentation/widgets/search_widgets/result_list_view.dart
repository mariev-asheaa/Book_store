import 'package:bookly_app/presentation/widgets/home_widgets/best_seller_item.dart';
import 'package:bookly_app/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/styels.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchFauilre) {
          return const Center(
            child: Text(
              'We are sorry,There are no matching books',
              textAlign: TextAlign.center,
              style: Styles.textStyle20,
            ),
          );
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return  Center(
            child: Image.asset('assets/images/curiosity search-pana.png'),

          );
        }
      },
    );
  }
}
