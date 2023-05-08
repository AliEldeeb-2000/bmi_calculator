import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext{

  double get screenHeight=> MediaQuery.of(this).size.height;
  double get screenWidth=> MediaQuery.of(this).size.width;

}
extension NavigatorHelper on BuildContext{

  void push(widget){
    Navigator.push(this, MaterialPageRoute(builder: (context)=> widget));
  }


}