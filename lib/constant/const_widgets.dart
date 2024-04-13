import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
    color: Colors.black
);

const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 18.0,
    color: Colors.black
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  color: Colors.black,
);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,
);

var kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.blueGrey.withOpacity(0.3),
  icon: const Icon(
    Icons.location_city,
    color: Colors.black,
  ),
  hintText: 'Enter City Name',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
