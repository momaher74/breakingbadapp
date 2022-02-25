import 'package:breakingbad/cubit/app_cubit.dart';
import 'package:breakingbad/helpers/methods.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteQuotesScreen extends StatelessWidget {
  CompleteQuotesScreen({Key? key, required this.id}) : super(key: key);
  int id;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppCubit.get(context).getCompleteQuotes(id: id);
      return BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          var data = cubit.complete;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Complete Quote'),
            ),
            backgroundColor: Colors.black87,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConditionalBuilder(
                    condition: state is ! GetCompleteQuotesLoadingState,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          MyHeightSizedBox(x: 50),
                          Text(
                            data![0]['author'].toString(),
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                            overflow: TextOverflow.ellipsis,
                          ),
                          MyHeightSizedBox(
                            x: 40,
                          ),
                          Text(
                            data[0]['quote'].toString(),
                            maxLines: 3,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ) ;
                    },
                    fallback: (BuildContext context) {
                      return const MyCircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
