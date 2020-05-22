import 'package:flutter/material.dart';
import 'package:mercaditoapp/models/negocio.dart';
import 'package:mercaditoapp/repository/negociosRepository.dart';

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

  var metodosPago = '${negocio.metodoPago}';
  String newMetodosPago = metodosPago.replaceAll("[", "").replaceAll("]", "");
  var metodos = newMetodosPago.split(',');
  List<Container> createChildMetodos() {
    List<Container> childrenTexts = List<Container>();
    for (String name in metodos) {
      childrenTexts.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(3),
          ),
          //alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: Text(
            name, 
            style: new TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return childrenTexts;
  }

  var categoria = '${negocio.categorias}';
  String newCategoria = categoria.replaceAll("[", "").replaceAll("]", "");
  var categorias = newCategoria.split(',');
  List<Container> createChildCategorias() {
    List<Container> childrenTexts = List<Container>();
    for (String name in categorias) {
      childrenTexts.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(3),
          ),
          //alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: Text(
            name, 
            style: new TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return childrenTexts;
  }

  String distancia = '${negocio.distancia}';
  double newDistancia = double.parse(distancia);
  String kmt = newDistancia.toStringAsFixed(3);
  Text distancias(){
    String dist;
    if(kmt.substring(0,2) == '0.'){
      if(kmt.substring(0,3) == '0.0'){
        if(kmt.substring(0,4) == '0.00'){
          if(kmt.substring(0,5) == '0.000'){
            return Text('0 m');
          }
          else{
            dist = kmt.substring(4);
            return Text('$dist m');
          }
        }
        else{
          dist = kmt.substring(3);
          return Text('$dist m');
        }
      }
      else{
        dist = kmt.substring(2);
        return Text('$dist m');
      }
    }
    else{
      dist = kmt.substring(0);
      return Text('$dist km');
    }
  }
  
  return Card(
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: Image(
            image: NetworkImage('https://mercadito.fiuls.cl/sources/upload/commerce/${negocio.id}/${negocio.imagen}'),
            width: 200,
            height: 200,
            ),
        ),
        Text(
          '${negocio.nombre}',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
              ),
          ),
        Text(
          '${negocio.direccion}',
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
          ),
        Text(
          'Categorías',
          
          //textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: createChildCategorias(),
        ),
        Text(
          'Métodos de pago',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: createChildMetodos(),
        ),
        //Text('Despacho: ${negocio.despacho}'),
        //Text('Coquimbo: ${negocio.coberturaCoquimbo}'),
        //Text('La Serena: ${negocio.coberturaSerena}'),
        //Text('Contacto: ${negocio.nombreContacto}'),
        Container(
          child: distancias(),
        ),
        //Text('RRSS: ${negocio.redesSociales}'),
      ],
    ),
  );
}