import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final bool Ismale;
  final double Result;
  final int age;

  String get resultPhrase
  {
    String resulttext=" ";
    if(Result>=30)
      resulttext= "Fat";
    else if (Result<30 && Result>25)
      resulttext="Overweight";
    else if (Result<25 && Result>=18.5)
      resulttext="Normal";
    else
       resulttext="Thin";


    return resulttext ;
  }

  const result(
      {Key? key, required this.Ismale, required this.Result, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Result",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        iconTheme:  const IconThemeData(color: Colors.white,size: 40),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Gender : ${Ismale ? 'male' : 'fmale'}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Age : $age",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Result : ${Result.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Healthiness : $resultPhrase",
              style:Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
