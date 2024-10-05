import 'package:bookly_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';



class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<Offset> slider;
  @override
  void initState() {
    super.initState();
   slidingAnimation();
  navigateToHome();
  }
  @override
  void dispose() { //to manage memory leak
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
      //make the child take the max possible width and became in the center
      children: [
        const SizedBox(height: 70,),
    Image.asset('assets/images/Book lover-pana.png',height: 400,width: 400,),
    Image.asset(AssetsData.logo),

        AnimatedBuilder(//we use this to rebuild only this part
  animation: slider,
  builder: (context,_) {
    return SlideTransition(
      position:slider ,
      child: const Center(child: Text('Enjoy reading free books',style:
      TextStyle(
        fontSize: 20
      ),)),
    );
  }
)
      ],
    );
  }

  void slidingAnimation(){
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 3));
    super.initState();
    slider=Tween<Offset>(begin: const Offset(0,2),end:Offset.zero).animate(controller);
    controller.forward();
  }
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 5),(){
    GoRouter.of(context).push('/home');
    });
  }
}

