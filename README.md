# Catálogo de Pontos Turísticos da Baixada Santista

Aluno: Danilo Almeida Brito  
Disciplina: Desenvolvimento para Dispositivos Móveis I

Aplicativo Flutter simples, baseado na organização dos exemplos das aulas: tela em `Principal`, métodos `_titulo()` e `_corpo()` e componentes separados em métodos.

## Pontos turísticos

- Museu Pelé — Santos
- Vila Belmiro — Santos
- Museu do Café — Santos
- Monte Serrat — Santos
- Ilha Porchat — São Vicente
- Biquinha de Anchieta — São Vicente
- Forte São João — Bertioga

Cada local possui nome, cidade, foto, descrição e duas caixas independentes para marcar favorito e visitado. As marcações ficam apenas em memória e são perdidas ao encerrar e abrir o aplicativo.

As imagens estão em `assets/imagens/` e são exibidas com `Image.asset`, sem necessidade de internet durante o uso.

## Executar

Com o Flutter instalado, abra um terminal na pasta do projeto:

```bash
flutter pub get
flutter run -d chrome
```

Para Android, conecte um dispositivo ou inicie um emulador e execute `flutter run`.

## Verificar

```bash
flutter analyze
flutter test
flutter build web
```

Os testes verificam os sete locais, as imagens, as duas marcações independentes, a manutenção das marcações ao rolar a lista, a limpeza do estado ao recriar a tela e o layout em 320 pixels de largura.

## Fontes das informações e imagens

| Local | Fonte |
| --- | --- |
| Museu Pelé | [Turismo Santos — foto de Anderson Bianchi](https://turismosantos.com.br/pt-br/content/museu-pele-0) |
| Vila Belmiro | [Prefeitura de Santos](https://www.santos.sp.gov.br/portal/vila-belmiro) |
| Museu do Café | [Turismo Santos](https://www.turismosantos.com.br/pt-br/content/museu-do-cafe) |
| Monte Serrat | [Turismo Santos — foto de Isabela Carrari](https://turismosantos.com.br/pt-br/content/monte-serrat) |
| Ilha Porchat | [Prefeitura de São Vicente](https://www.saovicente.sp.gov.br/sv-film-commission-1/catalogo-de-locacoes/ilha-porchat) |
| Biquinha de Anchieta | [Prefeitura de São Vicente](https://www.saovicente.sp.gov.br/visite-sao-vicente-1/o-que-fazer/praca-da-biquinha-de-anchieta) |
| Forte São João | [Prefeitura de Bertioga](https://www.bertioga.sp.gov.br/turismo/roteiros/forte-sao-joao) |

As fotografias pertencem aos respectivos autores e fontes indicadas. Uso neste projeto acadêmico.
