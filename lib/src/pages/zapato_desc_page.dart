import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen: true)
              ),

              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                )
              )
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720', 
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ),

                  _MontoBuyNow(),

                  _ColoresYMas(),

                  _BotonesLikeCartSettings()

                ],
              ),
            )
          )
        ],
      ),
   );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  
  final Icon icon;
  
  const _BotonSombreado( this.icon,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset:Offset(0,10))
        ]
      ),
      child: this.icon,
    );
  }
}

//Colores Widget
class _ColoresYMas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: items(length: 4),
            // child: Stack(
            //   children: [
            //     Positioned(left:90, child: _BotonColor(Color(0xffC6D642))),
            //     Positioned(left:60, child: _BotonColor(Color(0xffFFAD29))),
            //     Positioned(left:30, child: _BotonColor(Color(0xff2099F1))),
            //     _BotonColor(Color(0xff364D56)),
            //   ],
            // )
          ),

          BotonGeneral(texto:'More related items', alto: 30, ancho: 170, color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String imagePath;

  const _BotonColor(
    this.color, 
    this.index, 
    this.imagePath
  );


  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = imagePath;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

Widget items({required int length}){

    List<Color> colors = [
      Color(0xff41555E),
      Color(0xff3EA4F6),
      Color(0xffFFB100),
      Color(0xffCDDC3B),
      Color(0xffFFB100),
      Colors.red,
      Color(0xffFFB100),
      Colors.blue,
      Color(0xffFFB100),
      Colors.red,
      Colors.yellow,
    ]; 

    List<String> imagesPath = [
      'assets/imgs/negro.png',
      'assets/imgs/azul.png',
      'assets/imgs/amarillo.png',
      'assets/imgs/verde.png'
    ];
 
    List<Widget> postioned=[];
    for (int item = length; item >= 1; item--){
      postioned.add(
        Positioned(
          left: (item-1) * 30,
          child:_BotonColor(colors[item-1], item - 1 , imagesPath[item-1])
        )
      );
    }
    postioned.add(Container(height:45,));
    return Stack(
      children:postioned,
    );
}

//MontoBuyNow Widget
class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonGeneral(texto: 'Buy now', ancho: 120, alto: 40)
            )
          ],
        ),
      ),
    );
  }
}