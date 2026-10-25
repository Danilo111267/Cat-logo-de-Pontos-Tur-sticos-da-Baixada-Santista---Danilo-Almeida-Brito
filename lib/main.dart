// Danilo Almeida Brito
import 'package:flutter/material.dart';

void main() => runApp(const Principal());

class Principal extends StatefulWidget {
  const Principal({super.key});

  static const String nomeAluno = 'Danilo Almeida Brito';

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<PontoTuristico> _pontos = <PontoTuristico>[
    PontoTuristico(
      nome: 'Museu Pelé',
      cidade: 'Santos',
      imagem: 'assets/imagens/museu_pele.jpg',
      descricao:
          'Museu no Valongo que conta a trajetória de Pelé com objetos, '
          'fotografias e lembranças de sua carreira.',
    ),
    PontoTuristico(
      nome: 'Vila Belmiro',
      cidade: 'Santos',
      imagem: 'assets/imagens/vila_belmiro.jpg',
      descricao:
          'Estádio Urbano Caldeira, casa do Santos Futebol Clube e '
          'palco de momentos marcantes do futebol brasileiro.',
    ),
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      imagem: 'assets/imagens/museu_cafe.jpg',
      descricao:
          'Instalado na antiga Bolsa Oficial de Café, apresenta a '
          'história do café e sua importância para o Brasil.',
    ),
    PontoTuristico(
      nome: 'Monte Serrat',
      cidade: 'Santos',
      imagem: 'assets/imagens/monte_serrat.jpg',
      descricao:
          'Morro com vista panorâmica da cidade, acesso por funicular '
          'ou escadaria e o Santuário de Nossa Senhora do Monte Serrat.',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'São Vicente',
      imagem: 'assets/imagens/ilha_porchat.jpg',
      descricao:
          'Ponto turístico com vista para o litoral. No alto fica o '
          'Memorial dos 500 Anos, projetado por Oscar Niemeyer.',
    ),
    PontoTuristico(
      nome: 'Biquinha de Anchieta',
      cidade: 'São Vicente',
      imagem: 'assets/imagens/biquinha.jpg',
      descricao:
          'Fonte histórica localizada na Praça da Biquinha de '
          'Anchieta, um dos pontos tradicionais da cidade.',
    ),
    PontoTuristico(
      nome: 'Forte São João',
      cidade: 'Bertioga',
      imagem: 'assets/imagens/forte_sao_joao.jpg',
      descricao:
          'Fortificação histórica próxima ao Canal de Bertioga, '
          'ligada à defesa do litoral durante o período colonial.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: _titulo(), body: _corpo()),
    );
  }

  AppBar _titulo() {
    return AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Pontos Turísticos', style: TextStyle(fontSize: 20)),
          Text(Principal.nomeAluno, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  ListView _corpo() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _pontos.length,
      itemBuilder: (context, indice) {
        return _itemPonto(_pontos[indice]);
      },
    );
  }

  Container _itemPonto(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ponto.nome,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(ponto.cidade),
          const SizedBox(height: 8),
          _foto(ponto),
          const SizedBox(height: 8),
          Text(ponto.descricao),
          const SizedBox(height: 8),
          _marcacoes(ponto),
        ],
      ),
    );
  }

  Row _marcacoes(PontoTuristico ponto) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: ponto.favorito,
          onChanged: (valor) => _alterarFavorito(ponto, valor),
        ),
        const Expanded(child: Text('Favorito')),
        const SizedBox(width: 12),
        Checkbox(
          value: ponto.visitado,
          onChanged: (valor) => _alterarVisitado(ponto, valor),
        ),
        const Expanded(child: Text('Visitado')),
      ],
    );
  }

  void _alterarFavorito(PontoTuristico ponto, bool? valor) {
    setState(() {
      ponto.favorito = valor ?? false;
    });
  }

  void _alterarVisitado(PontoTuristico ponto, bool? valor) {
    setState(() {
      ponto.visitado = valor ?? false;
    });
  }

  Image _foto(PontoTuristico ponto) {
    return Image.asset(
      ponto.imagem,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
      semanticLabel: ponto.nome,
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String imagem;
  final String descricao;
  bool favorito;
  bool visitado;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.imagem,
    required this.descricao,
    this.favorito = false,
    this.visitado = false,
  });
}
