import 'package:bookly_app/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../home_widgets/book_item.dart';

class AlsoLikeBooksListview extends StatelessWidget {
  const AlsoLikeBooksListview({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBookSuccess){
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child:
                  Bookitem(image:state.books[index].volumeInfo.imageLinks?.thumbnail??'No Cover' ,),
                );
              }),
        );
      }else if (state is SimilarBooksFailure){
          return  Text(state.errormessage);
        }else {
          return  const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
