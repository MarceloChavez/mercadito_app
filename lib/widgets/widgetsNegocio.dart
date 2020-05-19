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
        Text('Nombre: ${negocio.nombre}'),
        Text('Latitud: ${negocio.latitud}'),
        Text('Longitud: ${negocio.longitud}'),
        Text('Categorias: ${negocio.categorias}'),
        Text('Métodos de pago: ${negocio.metodoPago}'),
        Text('Descripción: ${negocio.descripcion}'),
        Text('Despacho: ${negocio.despacho}'),
        Text('Coquimbo: ${negocio.coberturaCoquimbo}'),
        Text('La Serena: ${negocio.coberturaSerena}'),
        Text('Contacto: ${negocio.nombreContacto}'),
        Text('Distancia: ${negocio.distancia}'),
      ],
    ),
  );
}