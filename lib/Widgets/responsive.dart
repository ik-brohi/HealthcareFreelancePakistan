import 'package:flutter/material.dart';

double countHeight(var staticheight, context) {
  var height = MediaQuery.of(context).size.height;

  return (staticheight / 821) * height;
}

double countWidth(var staticwidth, context) {
  var width = MediaQuery.of(context).size.width;

  return (staticwidth / 394) * width;
}
