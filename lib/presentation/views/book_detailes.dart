import 'package:bookly_app/core/helper/service_locater.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/presentation/widgets/book_details_widgets/book_details_body.dart';
import 'package:bookly_app/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailes extends StatefulWidget {
  const BookDetailes({super.key, required this.bookModel});

final BookModel bookModel;
  @override
  State<BookDetailes> createState() => _BookDetailesState();
}

class _BookDetailesState extends State<BookDetailes> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).similarbooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsBody(bookModel:widget.bookModel,)),
    );
  }
}
