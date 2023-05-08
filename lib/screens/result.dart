import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.isMale, required this.age, required this.result})
      : super(key: key);

  final bool isMale;
  final int age;
  final double result;

  String get resultPhrase{
    String resultText = '';
    if(result >= 30) resultText = 'Obese';
    else if(result > 25 && result < 30) resultText = 'overWeight';
    else if(result >= 18 && result < 24.9) resultText = 'normal';
    else resultText = 'Thin';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('your current bmi is ' ,style: TextStyle(color: Colors.white , fontSize: 25),),
              DefaultTextStyle(
                textAlign: TextAlign.center,
                style:const TextStyle(
              color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,

              ), child: Container(
                color: const Color(0xFF1A1A1A),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children : [
                      Text(resultPhrase, style: const TextStyle(color: Colors.green),),
                      Text(result.toStringAsFixed(1),style: const TextStyle(fontSize: 30)),
                      Text('your bmi is  $resultPhrase'',Good Jop' ,style: const TextStyle(fontSize: 18),),

                    ]

                ),
              ),
              )],
          ),
        ),
        );
  }
}
