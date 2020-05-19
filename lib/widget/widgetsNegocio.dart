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