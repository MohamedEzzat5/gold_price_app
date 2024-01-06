// ignore_for_file: prefer_const_constructors
import 'package:flutter_api_gold/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_gold/network/dio_helper.dart';

import 'cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => MainCubit()..getGoldPrice()..getSilverPrice(),

      child: BlocConsumer<MainCubit,States>(
        listener: (context, state) {},
        builder:(context, state) =>
            Scaffold(
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            title: Center(
                child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  text: 'TODAY ',
                  children: const [
                    TextSpan(
                        text: 'PRICE',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ))
                  ]),
            )),
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'images/gold.png',
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gold',
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: MediaQuery.of(context).size.width / 10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${MainCubit.get(context).goldI}\$',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: MediaQuery.of(context).size.width / 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                //silver
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/silver.png',
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2.5),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Silver',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${MainCubit.get(context).silverI}\$',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
