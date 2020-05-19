import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mercaditoapp/models/negocio.dart';
import 'package:mercaditoapp/repository/negociosRepository.dart';

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
      appBar: AppBar(title: Text('Post Page')),
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

  Widget negociosListWidget(List<Negocio> negociosList) {
    return ListView.builder(
      itemCount: negociosList.length,
      itemBuilder: (BuildContext context, int index) {
        return negocioCard(negociosList[index]);
      },
    );
  }

  Widget negocioCard(Negocio negocio) {
    NegocioRepository repository = new NegocioRepository();
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: NetworkImage('https://mercadito.fiuls.cl/sources/upload/commerce/${negocio.id}/${negocio.imagen}')),
          Text('id: ${negocio.id}'),
          Text('nombre: ${negocio.nombre}'),
          Text('latitud: ${negocio.latitud}'),
          Text('longitud: ${negocio.longitud}'),
        ],
      ),
    );
  }

}