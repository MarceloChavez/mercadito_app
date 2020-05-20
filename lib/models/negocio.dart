import 'package:mercaditoapp/functions/negocioFunctions.dart';

class Negocio {
  int id;
  String nombre;
  String direccion;
  double latitud;
  double longitud;
  List<String> categorias;
  List<String> metodoPago;
  String descripcion;
  String despacho;
  List<String> coberturaCoquimbo;
  List<String> coberturaSerena;
  String nombreContacto;
  List<dynamic> redesSociales;
  String imagen;
  double distancia;


  Negocio.fromJson(Map<String, dynamic> json){
    var listCat = getCategoriasFromJson(json['categorias']); // se agregó la función getCategoriasFromJson
    var listPago = getMetodosPagoFromJson(json['metodo_pago']);
    var listCoq = getCoberturasCoquimboFromJson(json['cobertura_coquimbo']);
    var listSer = getCoberturasSerenaFromJson(json['cobertura_laserena']);
    var listSoc = getRedesSocialesFromJson(json['rrss']['url']);

    id  = json['id'];
    nombre  = json['nombre'];
    direccion  = json['direccion'];
    latitud  = json['latitud'];
    longitud  = json['longitud'];
    categorias = listCat;
    metodoPago = listPago;
    descripcion = json['descripcion'];
    despacho = json['despacho'];
    coberturaCoquimbo = listCoq;
    coberturaSerena = listSer;
    nombreContacto = json['nombre_contacto'];
    redesSociales = listSoc;
    imagen = json['imagen'];
    distancia = json['distance'];
  }
}