import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constant.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo,height: 26,),
          IconButton(onPressed: (){
            GoRouter.of(context).push('/search');
          }, icon: const Icon(Icons.search,size: 30,)),
        ],
      ),
    );
  }
}