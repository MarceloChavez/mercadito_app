import 'package:mercaditoapp/models/negocio.dart';

List<Negocio> getNegociosList(List<dynamic> json) {
    List<Negocio> negociosList = [];
    try { 
      for (var i = 0; i < json.length; i++) {
        if (json[i] != null) {
          print(i); // cambie a un for normal para usar el index en caso de debug
          negociosList.add(Negocio.fromJson(json[i]));
        }
      }
    } catch (e) {
      print(e);
    }
    return negociosList;
  }

List<String> getCategoriasFromJson(dynamic jsonCategorias) {
    List<String> categoriasList = [];
    if (jsonCategorias != null) { // valida si las categorias vienen vacias
      for (var categoria in jsonCategorias) {
        categoriasList.add(categoria); // va llenando la lista de categorias
      }
    } else {
      return ['Sin categorias']; // si las categorias son null devuelve esto
    }
    return categoriasList; // retorna la lista de categorias
  }

List<String> getMetodosPagoFromJson(dynamic jsonMetodosPago) {
    List<String> metodosPagoList = [];
    if (jsonMetodosPago != null) {
      for (var metodoPago in jsonMetodosPago) {
        metodosPagoList.add(metodoPago);
      }
    } else {
      return ['Sin método de pago'];
    }
    return metodosPagoList;
  }

List<String> getCoberturasCoquimboFromJson(dynamic jsonCoberturasCoquimbo) {
    List<String> coberturasCoquimboList = [];
    if (jsonCoberturasCoquimbo != null) {
      for (var coberturaCoquimbo in jsonCoberturasCoquimbo) {
        coberturasCoquimboList.add(coberturaCoquimbo);
      }
    } else {
      return ['Sin cobertura en Coquimbo'];
    }
    return coberturasCoquimboList;
  }

List<String> getCoberturasSerenaFromJson(dynamic jsonCoberturasSerena) {
    List<String> coberturasSerenaList = [];
    if (jsonCoberturasSerena != null) {
      for (var coberturaSerena in jsonCoberturasSerena) {
        coberturasSerenaList.add(coberturaSerena);
      }
    } else {
      return ['Sin cobertura en La Serena'];
    }
    return coberturasSerenaList;
  }

List<String> getRedesSocialesFromJson(dynamic jsonRedesSociales) {
    List<String> redesSocialesList = [];
    if (jsonRedesSociales != null) {
      for (var redesSociales in jsonRedesSociales) {
        redesSocialesList.add(redesSociales);
      }
    } else {
      return ['Sin redes sociales'];
    }
    return redesSocialesList;
  }