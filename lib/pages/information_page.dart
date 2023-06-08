import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {

  final String texto = 'A sustentabilidade é um conceito fundamental para garantir o equilíbrio entre o desenvolvimento humano e a preservação do meio ambiente. Ela envolve a adoção de práticas e medidas que visam atender às necessidades presentes, sem comprometer a capacidade das futuras gerações de suprir suas próprias demandas.  No centro da sustentabilidade está a conscientização de que os recursos naturais são limitados e precisam ser utilizados de forma responsável. Isso implica em buscar alternativas mais eficientes e menos impactantes, tanto na produção de bens e serviços quanto no consumo desses recursos. A sustentabilidade engloba três pilares fundamentais: o social, o econômico e o ambiental. O pilar social diz respeito à garantia de condições dignas de vida para todas as pessoas, levando em consideração aspectos como saúde, educação, segurança, igualdade de oportunidades e respeito aos direitos humanos.  O pilar econômico busca conciliar o crescimento econômico com a equidade social e a preservação do meio ambiente. Isso envolve a promoção de negócios sustentáveis, que considerem não apenas o lucro imediato, mas também os impactos de longo prazo nas comunidades e no planeta.  Já o pilar ambiental está relacionado à conservação dos recursos naturais e à redução dos impactos ambientais. Isso implica em adotar práticas de produção e consumo conscientes, que minimizem a geração de resíduos, reduzam a poluição, promovam a reciclagem e busquem fontes de energia limpas e renováveis. A sustentabilidade também está intrinsecamente ligada ao combate às mudanças climáticas, que representam uma das maiores ameaças ao equilíbrio do planeta. Nesse sentido, é importante promover a transição para uma economia de baixo carbono, reduzindo as emissões de gases de efeito estufa e buscando soluções sustentáveis para os desafios ambientais. Além disso, a sustentabilidade envolve a conscientização e a participação ativa de todos os setores da sociedade: governos, empresas, organizações não governamentais e cidadãos. É necessário fomentar a educação ambiental, incentivar a pesquisa científica e promover ações coletivas para transformar o modelo atual de desenvolvimento em um modelo mais sustentável. Em resumo, a sustentabilidade é um princípio que busca conciliar o bem-estar humano com a proteção do meio ambiente, promovendo a utilização responsável dos recursos naturais, a equidade social e o crescimento econômico sustentável. É um desafio complexo, porém essencial para garantir um futuro melhor para as próximas gerações.';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  width: 30,
                ),
                const Text(
                  'O que é sustentabilidade?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://blog.urbanflowers.com.br/wp-content/uploads/2019/03/282065-teoria-da-sustentabilidade-como-aplicala-na-pratica.jpg',
                height: 200,
                width: 1000,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  textAlign: TextAlign.justify,
                  texto,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 16,overflow: TextOverflow.fade),
                ),
              ),
            ),
          ),
        ],
      ),
      ],
    );
  }
}
