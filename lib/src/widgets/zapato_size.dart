import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 460,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: [

            //Zapato&Sombra
            _ZapatoConSombra(),

            //Tallas

          ],
        ),
        
      ),
    );
  }
}



class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: [

          Image(image: AssetImage('assets/imgs/azul.png')),

          
        ],
      ),
    );
  }
}