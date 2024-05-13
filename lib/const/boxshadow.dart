import 'package:flutter/material.dart';

BoxDecoration BoxDecorationBG = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24), // มุมมนบนซ้าย
      topRight: Radius.circular(24), // มุมมนบนขวา
    ),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 2),
      )
    ]);

BoxDecoration BoxDecorationItems = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 2),
      )
    ]);

