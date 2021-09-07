import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(texto: 'For you'),
          SizedBox(height: 20),
          ZapatoSizePreview()
        ],
      ),
   );
  }
}