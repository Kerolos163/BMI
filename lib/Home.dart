// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'result.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool ismale = true;
  int weigth = 20;
  int age = 18;
  double heightv = 170;
  Expanded w_ex(Icon x, String y) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            y == 'Male' ? ismale = true : ismale = false;
          });
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (ismale && y == 'Male') || (!ismale && y == 'Female')
                    ? Colors.blueGrey
                    : Colors.teal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                x,
                const SizedBox(
                  height: 10,
                ),
                Text(
                  y,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            )),
      ),
    );
  }

  Expanded w_ex2(String y) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.teal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                y,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                y == 'Weight' ? '${weigth}' : '${age}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: Text("btn1"),
                    backgroundColor: Colors.blueGrey,
                    onPressed: (() {
                      setState(() {
                        y == 'Weight' ? weigth-- : age--;
                      });
                    }),
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    heroTag: Text("btn2"),
                    backgroundColor: Colors.blueGrey,
                    onPressed: (() {
                      setState(() {
                        y == 'Weight' ? weigth++ : age++;
                      });
                    }),
                    mini: true,
                    child: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  w_ex(const Icon(Icons.male), "Male"),
                  const SizedBox(
                    width: 15,
                  ),
                  w_ex(const Icon(Icons.female), "Female")
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  
                borderRadius: BorderRadius.circular(10), color: Colors.teal),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height",style: Theme.of(context).textTheme.headline2,),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        
                          Center(child: Text("${heightv}",style: Theme.of(context).textTheme.headline1,)),
                          SizedBox(width: 5,),
                          Center(child: Text("Cm",style: Theme.of(context).textTheme.bodyText1,))
                      ],),
                      Slider(value: heightv, onChanged: (newvalue){
                        setState(()=> heightv=newvalue);

                      },
                      divisions:250,
                      max: 250,
                      activeColor: Colors.blueGrey,
                      thumbColor: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  w_ex2("Weight"),
                  const SizedBox(
                    width: 15,
                  ),
                  w_ex2("Age")
                ],
              ),
            )),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  double R = weigth / pow(heightv / 100, 2);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      print(R);
                      return result(
                        age: age,
                        Result: R,
                        Ismale: ismale,
                      );
                    },
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
