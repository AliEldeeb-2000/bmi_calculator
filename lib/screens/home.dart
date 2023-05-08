import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'package:bmi/helper.dart';
import 'package:bmi/screens/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightVal = 177;
  double weight = 55;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  topContainers(context, 'male'),
                  topContainers(context, 'female')
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heightVal.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'cm',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Slider(value: heightVal, onChanged: (newValue){
                    setState(() {
                      heightVal = newValue;
                    });
                  },min: 90,max: 200,)
                ],
              ),
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  lastContainers(
                    context,
                    'age',
                  ),
                  lastContainers(
                    context,
                    'weight',
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: context.screenHeight / 15,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  var result = weight / math.pow(heightVal / 100, 2);
                  context
                      .push(Result(isMale: isMale, age: age, result: result));
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell topContainers(
    BuildContext context,
    String gender,
  ) =>
      InkWell(
          onTap: () {
            setState(() {
              isMale = gender == 'male' ? true : false;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: context.screenWidth * 0.45,
            decoration: BoxDecoration(
                color: (isMale && gender == 'male') ||
                        (!isMale && gender == 'female')
                    ? Colors.teal
                    : Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                gender == 'male'
                    ? const Icon(
                        Icons.male,
                        size: 90,
                      )
                    : const Icon(
                        Icons.female,
                        size: 90,
                      ),
                Text(
                  gender == 'male' ? 'Male' : 'Female',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35),
                )
              ],
            ),
          ));

  lastContainers(
    BuildContext context,
    String type,
  ) =>
      Container(
          width: context.screenWidth * 0.45,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                type == 'age' ? 'Age' : 'Weight',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                type == 'age' ? '$age' : '$weight',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ));
}
