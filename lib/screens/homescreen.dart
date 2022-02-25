import 'package:breakingbad/cubit/app_cubit.dart';
import 'package:breakingbad/helpers/methods.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        var data = cubit.data;
        return  SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  MyHeightSizedBox(x: 30),
                  MyText(
                    text: 'Characters',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  MyHeightSizedBox(x: 30),
                  ConditionalBuilder(
                    condition: data!.length!=0,
                    builder: (context) => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Column(
                              children: [
                                Image(
                                  width: 300,
                                  height: 150,
                                  image: NetworkImage(
                                    data[index]['img'],
                                  ),
                                ),
                                Column(
                                  children: [
                                    MyHeightSizedBox(x: 12),
                                    MyText(
                                      text: data[index]['name'],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    MyHeightSizedBox(x: 12),
                                    MyText(
                                        text: 'Nickname ' +
                                            data[index]['nickname']
                                                .toString(),
                                        fontSize: 15),
                                    MyHeightSizedBox(x: 12),
                                    if (data[index]['appearance'].length != 0)
                                      MyText(
                                          text: 'Seasons ' +
                                              data[index]['appearance']
                                                  .toString(),
                                          fontSize: 15),
                                  ],
                                ),
                                MyHeightSizedBox(x: 12),
                              ],
                            ),
                          ],
                        );
                      },
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .7,
                        crossAxisCount: 2,
                      ),
                    ),
                    fallback: (context)=> const MyCircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
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
