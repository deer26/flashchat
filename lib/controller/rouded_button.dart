import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String title;
  final Function onPress;

  RoundedButton({this.colour, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Material(
        color: colour,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(
          30.0,
        ),
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: onPress,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
