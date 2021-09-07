import 'package:flutter/material.dart';

class BotonCarrito extends StatelessWidget {

  final String texto;


  const BotonCarrito({
    required this.texto 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 50,
      
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$texto', style: TextStyle(color: Colors.white)),
    );
  }
}