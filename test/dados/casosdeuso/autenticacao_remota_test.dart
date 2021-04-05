import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class AutenticacaoRemota {
  
   ClienteHttp clienteHttp;
   String url;

  AutenticacaoRemota({
    @required this.clienteHttp,
    @required this.url
  });

  Future<void> autentica() async {
    await clienteHttp.requisita(url: url);
  }
}

abstract class ClienteHttp{
  Future<void> requisita({
    @required String url
  });
}

class ClienteHttpSimulada extends Mock implements ClienteHttp{

}

void main() {
  test('Deveria chamar o ClienteHttp com a URL correta', () async {
    
    // Preparamos
    final clienteHttp = ClienteHttpSimulada();
    final url = faker.internet.httpUrl();
    // sut - System Under Test - mostra qual classe que está sendo testada
    final sut = AutenticacaoRemota(clienteHttp: clienteHttp, url: url);
    
    // Ação
    await sut.autentica();

    // O que é Esperado
    verify(clienteHttp.requisita(url: url));
  });
}