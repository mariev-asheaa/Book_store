import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/helper/service_locater.dart';
import 'package:bookly_app/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/presentation/views/book_detailes.dart';
import 'package:bookly_app/presentation/views/home.dart';
import 'package:bookly_app/presentation/views/search.dart';
import 'package:bookly_app/presentation/views/splash.dart';
import 'package:bookly_app/view_model/best_books_cubit/best_books_cubit.dart';
import 'package:bookly_app/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/view_model/search_cubit/search_cubit.dart';
import 'package:bookly_app/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/models/book_model/book_model.dart';
void main() {
  setup();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
   BlocProvider(
     create: (context) => NewestBooksCubit(getIt.get<Implementation>(),
     )..newestbooks()
     ,),
    BlocProvider(
      create: (context) => BestBooksCubit(getIt.get<Implementation>(),
      )..bestbooks()
      ,)
  ],
  child: MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      //dark makes the text color white
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),

       ),
);
  }
}
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splash(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/book_details',
      builder: (context, state) =>  BlocProvider(
  create: (context) => SimilarBooksCubit(getIt.get<Implementation>()),
  child: BookDetailes(  bookModel:state.extra as BookModel,),
),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) =>  BlocProvider(
  create: (context) => SearchCubit(  getIt.get<SearchRepoImplementation>(),),
  child: const Search(),
),
    ),
  ],
);