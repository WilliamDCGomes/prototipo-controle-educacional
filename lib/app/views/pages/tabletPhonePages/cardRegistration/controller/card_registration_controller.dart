import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../helpers/paths.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';

class CardRegistrationController extends GetxController {
  late RxBool grayCard;
  late RxBool loadingAnimetion;
  late RxString cardImagePath;
  late RxString nameCardTyped;
  late RxString numberCardTyped;
  late RxString dueDateCardTyped;
  late RxString cvcCodeCardTyped;
  late RxString cardSelectedType;
  late TextEditingController cardNickname;
  late TextEditingController nameInCard;
  late TextEditingController cardNumber;
  late TextEditingController dueDate;
  late TextEditingController cvcCode;
  late TextEditingController cardOwnersCpf;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;

  CardRegistrationController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    grayCard = true.obs;
    loadingAnimetion = false.obs;
    cardImagePath = Paths.Card_Not_Registered.obs;
    numberCardTyped = "NÚMERO DO CARTÃO".obs;
    nameCardTyped = "NOME COMPLETO".obs;
    dueDateCardTyped = "DATA VENCIMENTO".obs;
    cvcCodeCardTyped = "CÓDIGO DE SEGURANÇA".obs;
    cardSelectedType = "".obs;
    cardNickname = TextEditingController();
    nameInCard = TextEditingController();
    cardNumber = TextEditingController();
    dueDate = TextEditingController();
    cvcCode = TextEditingController();
    cardOwnersCpf = TextEditingController();

    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
    );
  }

  saveButtonPressed(){
    loadingAnimetion.value = true;
    loadingWithSuccessOrErrorWidget.startAnimation();
  }

  numberCardEditing(String valueTyped){
    if(valueTyped == ""){
      numberCardTyped.value = "NÚMERO DO CARTÃO";
    }
    else {
      numberCardTyped.value = valueTyped;
    }
  }

  nameCardEditing(String valueTyped){
    if(valueTyped == ""){
      nameCardTyped.value = "NOME COMPLETO";
    }
    else{
      nameCardTyped.value = valueTyped;
    }
  }

  dueDateCardEditing(String valueTyped){
    if(valueTyped == ""){
      dueDateCardTyped.value = "DATA VENCIMENTO";
    }
    else {
      dueDateCardTyped.value = valueTyped;
    }
  }

  cvcCodeCardEditing(String valueTyped){
    if(valueTyped == ""){
      cvcCodeCardTyped.value = "CÓDIGO DE SEGURANÇA";
    }
    else {
      cvcCodeCardTyped.value = valueTyped;
    }
  }

  cardTypeChanged(String? newType){
    if(newType != null) {
      cardSelectedType.value = newType;
      switch(cardSelectedType.value){
        case "Débito":
          cardImagePath.value = Paths.Debit_Card;
          break;
        case "Crédito":
          cardImagePath.value = Paths.Credit_Card;
          break;
      }
    }
    else{
      cardImagePath.value = Paths.Card_Not_Registered;
    }
  }

  reverseCard(String? newType){
    if(newType != null) {
      cardSelectedType.value = newType;
      switch(cardSelectedType.value){
        case "Débito":
          cardImagePath.value = Paths.Debit_Card_Back;
          break;
        case "Crédito":
          cardImagePath.value = Paths.Credit_Card_Back;
          break;
      }
    }
    else{
      cardImagePath.value = Paths.Card_Not_Registered;
    }
  }
}