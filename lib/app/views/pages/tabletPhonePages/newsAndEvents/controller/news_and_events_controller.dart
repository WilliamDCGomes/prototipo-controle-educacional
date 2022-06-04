import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/news_and_events_card_widget.dart';

class NewsAndEventsController extends GetxController {
  late TextEditingController searchNewsAndEventsController;
  late List<NewsAndEventsCardWidget> newsAndEventsList;

  NewsAndEventsController(){
    _inicializeVariables();
    _inicializeList();
  }

  _inicializeVariables(){
    searchNewsAndEventsController = TextEditingController();
  }

  _inicializeList(){
    newsAndEventsList =  [
      NewsAndEventsCardWidget(
        firstValue: "Visita Técnica",
        secondValue: "Visita de integração dos conteúdos práticos que estão sendo abordados em Sistema Operacional",
        thirdValue: "15/08/2022 às 14h",
        onTap: () {

        },
      ),
      NewsAndEventsCardWidget(
        firstValue: "Treinamento",
        secondValue: "Os alunos vivenciaram os primeiros atendimentos às aulas práticas",
        thirdValue: "26/08/2022 às 16h",
        onTap: () {

        },
      ),
      NewsAndEventsCardWidget(
        firstValue: "Novo Prédio",
        secondValue: "Será inaugurado no próximo mês o novo prédio do campus",
        thirdValue: "15/09/2022 às 10h",
        onTap: () {

        },
      ),
      NewsAndEventsCardWidget(
        firstValue: "Oficinas Gratuitas",
        secondValue: "Candidatos podem aproveitar para usar a nota do Enem e conhecer os novos cursos",
        thirdValue: "20/09/2022 às 08h",
        onTap: () {

        },
      ),
    ];
  }
}