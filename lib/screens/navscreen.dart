import 'package:breakingbad/cubit/app_cubit.dart';
import 'package:breakingbad/helpers/methods.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.black,
          body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.black87,
              activeColor: Colors.deepPurple,
              color: Colors.white,
              items: const[
                TabItem(icon: Icons.home , title: 'Home',),
                TabItem(icon: Icons.tv_sharp, title: 'Episodes'),
                TabItem(icon: Icons.question_answer_outlined, title: 'Quotes'),
              ],
              onTap: (int i) =>cubit.changeIndex(i) ,
            )
        );
      },
    );
  }
}

// SizedBox(
// width: 150,
// height: 30,
// child: CarouselSlider(
// items: data.appearance
//     .map((e) => Container(
// color: Colors.red,
// width: 20,
// height: 20,
// child: Center(
// child: Text(
// e.toString(),
// style: const TextStyle(
// color: Colors.white,
// fontSize: 20),
// ),
// ),
// ))
//     .toList(),
// options: CarouselOptions(
// autoPlay: true,
// scrollDirection: Axis.horizontal),
// ),
// )
