import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../base/viewmodels/newsAndEventsViewmodel.dart';

class NewsAndEventsController extends GetxController {
  late TextEditingController searchNewsAndEventsController;
  late List<NewsAndEventsViewmodel> newsAndEventsList;

  NewsAndEventsController(){
    _inicializeVariables();
    _inicializeList();
  }

  _inicializeVariables(){
    searchNewsAndEventsController = TextEditingController();
  }

  _inicializeList(){
    newsAndEventsList =  [
      NewsAndEventsViewmodel(
        "Visita Técnica",
        "Visita de integração dos conteúdos práticos que estão sendo abordados em Sistema Operacional",
        "Faculdades Integradas de Bauru",
        "15/08/2022",
        "14:00",
        "18:00",
      ),
      NewsAndEventsViewmodel(
        "Treinamento",
        "Os alunos vivenciaram os primeiros atendimentos às aulas práticas",
        "Faculdades Integradas de Bauru",
        "26/08/2022",
        "16:00",
        "18:00",
      ),
      NewsAndEventsViewmodel(
        "Novo Prédio",
        "Será inaugurado no próximo mês o novo prédio do campus",
        "Faculdades Integradas de Bauru",
        "15/09/2022",
        "10:00",
        "16:00",
      ),
      NewsAndEventsViewmodel(
        "Oficinas Gratuitas",
        "Candidatos podem aproveitar para usar a nota do Enem e conhecer os novos cursos",
        "Faculdades Integradas de Bauru",
        "20/09/2022",
        "08:00",
        "17:00",
      ),
    ];
  }
}