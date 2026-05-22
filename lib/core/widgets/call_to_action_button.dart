
import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  final double? width;
  const CallToActionButton({
    this.width,
    required this.text,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF0D47A1), Colors.blue, Color(0xFF0D47A1)],
          ),
          border: BoxBorder.all(color: const Color.fromRGBO(0, 0, 0, 0)),

          borderRadius: BorderRadius.circular(12.0),
        ),
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: action,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              Padding(padding: EdgeInsetsGeometry.only(right: 15)),
              Text(text, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
