part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexSuccessState extends AppState {}

class GetCharsLoadingState extends AppState {}

class GetCharsSuccessState extends AppState {}

class GetCharsErrorState extends AppState {}

class GetEpisodeLoadingState extends AppState {}

class GetEpisodeSuccessState extends AppState {}

class GetEpisodeErrorState extends AppState {}

class GetQuotesLoadingState extends AppState {}

class GetQuotesSuccessState extends AppState {}

class GetQuotesErrorState extends AppState {}

class GetCompleteQuotesLoadingState extends AppState {}

class GetCompleteQuotesSuccessState extends AppState {}

class GetCompleteQuotesErrorState extends AppState {}
