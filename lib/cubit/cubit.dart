import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_api_gold/cubit/states.dart';

import '../network/dio_helper.dart';
class MainCubit extends Cubit<States> {
  MainCubit() : super(InitState());


  static MainCubit get(context) => BlocProvider.of(context);


  double? goldD;
  double? silverD;
  int? goldI;
  int? silverI;
  getGoldPrice(){
    DioHelper.getData('XAU/USD/').then((value) {

        goldD=value.data['price'];
        goldI=goldD!.round();
        print(goldI);
        emit(GetGoldPriceState());

    }).catchError((error){
      print(error.toString());
    });

  }
  getSilverPrice(){
    DioHelper.getData('XAG/USD/').then((value) {

        silverD=value.data['price'];
        silverI=silverD!.round();
        print(silverI);
        emit(GetSilverPriceState());

    }).catchError((error){
      print(error.toString());
    });

  }

}