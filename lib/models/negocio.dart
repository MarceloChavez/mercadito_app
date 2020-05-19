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
  //List<String> redesSociales;
  String imagen;
  double distancia;


  Negocio.fromJson(Map<String, dynamic> json){
    var listCat = json['categorias'];
    List<String> catList = listCat.cast<String>();
    //List<String> catList = new List<String>.from(listCat);

    var listPago = json['metodo_pago'];
    List<String> pagoList = listPago.cast<String>();
    //List<String> pagoList = new List<String>.from(listPago);

    var listCoq = json['cobertura_coquimbo'];
    List<String> coqList = listCoq.cast<String>();
    //List<String> coqList = new List<String>.from(listCoq);

    var listSer = json['cobertura_laserena'];
    //List<String> serList = listSer.cast<String>();
    List<String> serList = new List<String>.from(listSer);

    id  = json['id'];
    nombre  = json['nombre'];
    direccion  = json['direccion'];
    latitud  = json['latitud'];
    longitud  = json['longitud'];
    categorias = catList;
    metodoPago = pagoList;
    descripcion = json['descripcion'];
    despacho = json['despacho'];
    coberturaCoquimbo = coqList;
    coberturaSerena = serList;
    nombreContacto = json['nombre_contacto'];
    //redesSociales = socList;
    imagen = json['imagen'];
    distancia = json['distance'];
  }
}