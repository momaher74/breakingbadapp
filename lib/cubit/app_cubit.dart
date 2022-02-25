import 'package:bloc/bloc.dart';
import 'package:breakingbad/helpers/dio.dart';
import 'package:breakingbad/screens/episodescreen.dart';
import 'package:breakingbad/screens/homescreen.dart';
import 'package:breakingbad/screens/qoutescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  List screens = [
    const HomeScreen(),
    const EpisodesScreen(),
    const QuotesScreen(),
  ];
  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexSuccessState());
  }

  List? data = [];
  List? complete = [];
  List? quotes = [];
  List? episodes = [];

  void getChars() {
    emit(GetCharsLoadingState());
    DioHelper.getData(url: 'characters').then((value) {
      data = value.data;
      emit(GetCharsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCharsErrorState());
    });
  }

  void getEpisode() {
    emit(GetEpisodeLoadingState());
    DioHelper.getData(url: 'episodes').then((value) {
      episodes = value.data;
      emit(GetEpisodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetEpisodeErrorState());
    });
  }

  void getQuotes() {
    emit(GetQuotesLoadingState());
    DioHelper.getData(url: 'quotes').then((value) {
      quotes = value.data;
      emit(GetQuotesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetQuotesErrorState());
    });
  }

  void getCompleteQuotes({
    required int id,
  }) {
    emit(GetCompleteQuotesLoadingState());
    DioHelper.getData(url: 'quotes/$id').then((value) {
      complete = value.data;
      print(value.data);
      emit(GetCompleteQuotesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCompleteQuotesErrorState());
    });
  }

// getRates() {
//   emit(GetRateLoadingState());
//   DioHelper.getData(url: 'rate').then((value) {
//     print(value);
//     emit(GetRateSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(GetRateErrorState());
//   });
// }
}
