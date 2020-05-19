import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mercaditoapp/models/negocio.dart';
import 'package:mercaditoapp/repository/negociosRepository.dart';
import 'package:mercaditoapp/widget/widgetsNegocio.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final NegocioRepository negocioRepository = new NegocioRepository();
  bool showResponse = true;

  @override
  void initState() {
    super.initState();
    bool showResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Negocios cercanos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showResponse)
              responseWidget(), // una vez que presionemos el boton POST se mostrará el widget
          ],
        ),
      ),
    );
  }

  Widget responseWidget() {
    Map<String, dynamic> bodyPost = {
      // valores harcodeados
      'distancia': '25',
      'search': '',
      'categoria': 'ALL',
      'lat': '-29.887052399999998',
      'lon': '-71.2755305',
      'metodo_pago': ''
    };

    return FutureBuilder(// widget que se mostrará cuando presiones el botón POST
      future: negocioRepository.getNegocios(bodyPost), // Future que retorna los negocios
      builder: (BuildContext context, AsyncSnapshot snapshot) {// Función para construir la vista
        if (snapshot.hasData) { // validación si viene data
          List<dynamic> responseBody = json.decode(snapshot.data.body);
          List<Negocio> negociosList = getNegociosList(responseBody);

          return Container(
            height: 400,
            width: 400,
            child: negociosListWidget(negociosList),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  List<Negocio> getNegociosList(List<dynamic> json) {
    List<Negocio> negociosList = [];
    for (var negocio in json) {
      try{
        print(negocio['id']);
        if(negocio != null) {
          negociosList.add(Negocio.fromJson(negocio));
        }
      }
      catch(e){
        print(e);
      }
    }
    return negociosList;
  }
}