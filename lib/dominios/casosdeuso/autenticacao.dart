import 'package:meta/meta.dart';

import '../entidades/entidades.dart';


abstract class Autenticacao {
  Future<ContaEntidade> autentica({
    @required String email,
    @required String senha
  }); 
}