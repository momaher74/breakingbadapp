import 'package:breakingbad/cubit/app_cubit.dart';
import 'package:breakingbad/screens/allquote.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/methods.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        var data = cubit.quotes;
        return SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  MyHeightSizedBox(x: 30),
                  MyText(
                    text: 'Best Quotes',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  MyHeightSizedBox(x: 30),
                  ConditionalBuilder(
                    condition: data!.isNotEmpty,
                    builder: (context) => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            push(context, CompleteQuotesScreen(id: data[index]['quote_id'])) ;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyHeightSizedBox(x: 12),
                                MyText(
                                  text: data[index]['author'],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                                MyHeightSizedBox(x: 3),
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                ),
                                MyHeightSizedBox(x: 12),
                                Text(
                                  data[index]['quote'].toString(),
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.white, fontSize: 18),
                                  overflow: TextOverflow.ellipsis,

                                )
                              ],
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.2,
                        crossAxisCount: 2,
                      ),
                    ),
                    fallback: (context) => const MyCircularProgressIndicator(),
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
