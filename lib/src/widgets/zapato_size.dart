import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool? fullScreen;

  const ZapatoSizePreview({
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!this.fullScreen!)
          Navigator.push(context, MaterialPageRoute(builder: (context) => ZapatoDescPage()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen!) ? 5 : 30, 
          vertical: (this.fullScreen!) ? 5 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen!) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: 
            (this.fullScreen!) 
              ? BorderRadius.only(
                bottomLeft: Radius.circular(50), 
                bottomRight: Radius.circular(50), 
                topLeft: Radius.circular(40), 
                topRight: Radius.circular(40))
              : BorderRadius.circular(50)
          ),
          child: Column(
            children: [
    
              //Zapato&Sombra
              _ZapatoConSombra(),
    
              //Tallas
              if(!this.fullScreen!)
                _ZapatoTallas()
            ],
          ),
          
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

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = this.talla;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (this.talla == zapatoModel.talla) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.talla == zapatoModel.talla)
              BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
          ]
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Text(
            '${talla.toString().replaceAll('.0', '')}', 
            style: TextStyle(
              color: (this.talla == zapatoModel.talla) ? Colors.white : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


//Zapato&Sombra
class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: [

          Positioned(
            bottom: 20,
            right: 0,
            child: _Sombra()
          ),

          Image(image: AssetImage(zapatoModel.assetImage)), 
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