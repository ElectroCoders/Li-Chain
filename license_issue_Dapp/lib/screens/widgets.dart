import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final Icon icon;

  CustomButton({Key key, this.text, this.color, this.onTap, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
              icon == null
                  ? Container()
                  : Padding(
                      child: icon,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    )
            ],
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
