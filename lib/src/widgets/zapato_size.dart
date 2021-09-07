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
            _ZapatoTallas()
          ],
        ),
        
      ),
    );
  }
}


//Tallas
class _ZapatoTallas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CajaTalla(7),
          _CajaTalla(7.5),
          _CajaTalla(8),
          _CajaTalla(8.5),
          _CajaTalla(9),
          _CajaTalla(9.5),
        ],
      ),
    );
  }
}

class _CajaTalla extends StatelessWidget {

  final double talla;
  
  const _CajaTalla(
   this.talla,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (this.talla==9) ? Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(this.talla==9)
            BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
        ]
      ),

      child: Text(
        '${talla.toString().replaceAll('.0', '')}', 
        style: TextStyle(
          color: (this.talla==9) ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}


//Zapato&Sombra
class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: [

          Positioned(
            bottom: 20,
            right: 0,
            child: _Sombra()
          ),

          Image(image: AssetImage('assets/imgs/azul.png')), 
        ],
      ),
    );
  }
}

class _Sombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
        
      ),
    );
  }
}