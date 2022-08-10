import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/flag_card_type.dart';
import '../../../../../utils/paths.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class CardRegistrationTabletPhoneController extends GetxController {
  late RxBool grayCard;
  late RxBool loadingAnimation;
  late RxString cardImagePath;
  late RxString cardImageBackPath;
  late RxString nameCardTyped;
  late RxString numberCardTyped;
  late RxString dueDateCardTyped;
  late RxString cvcCodeCardTyped;
  late RxString cardSelectedType;
  late RxString flagCard;
  late FocusNode nameCardFocus;
  late FocusNode dueDateFocus;
  late FocusNode cvcCodeFocus;
  late FocusNode numberCardFocus;
  late TextEditingController cardNickname;
  late TextEditingController nameInCard;
  late TextEditingController cardNumber;
  late TextEditingController dueDate;
  late TextEditingController cvcCode;
  late TextEditingController cardOwnersCpf;
  late FlipCardController flipCardController;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  CardRegistrationTabletPhoneController(){
    _inicializeVariables();
    _addListeners();
  }

  _inicializeVariables(){
    grayCard = true.obs;
    loadingAnimation = false.obs;
    cardImagePath = Paths.Card_Not_Registered.obs;
    cardImageBackPath = Paths.Card_Not_Registered_Back.obs;
    numberCardTyped = "NÚMERO DO CARTÃO".obs;
    nameCardTyped = "NOME COMPLETO".obs;
    dueDateCardTyped = "DATA VENCIMENTO".obs;
    cvcCodeCardTyped = "CÓDIGO DE SEGURANÇA".obs;
    flagCard = "".obs;
    cardSelectedType = "".obs;
    cardNickname = TextEditingController();
    nameInCard = TextEditingController();
    cardNumber = TextEditingController();
    dueDate = TextEditingController();
    cvcCode = TextEditingController();
    cardOwnersCpf = TextEditingController();
    flipCardController = FlipCardController();
    nameCardFocus = FocusNode();
    dueDateFocus = FocusNode();
    cvcCodeFocus = FocusNode();
    numberCardFocus = FocusNode();

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  _addListeners(){
    nameCardFocus.addListener(() {
      if(nameCardFocus.hasFocus){
        cardTypeChanged();
      }
    });
    dueDateFocus.addListener(() {
      if(dueDateFocus.hasFocus){
        cardTypeChanged();
      }
    });
    cvcCodeFocus.addListener(() {
      if(cvcCodeFocus.hasFocus){
        reverseCard();
      }
    });
    numberCardFocus.addListener(() {
      if(numberCardFocus.hasFocus){
        cardTypeChanged();
      }
    });
  }

  saveButtonPressed(){
    loadingAnimation.value = true;
    loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation(backPage: true);
  }

  _refreshFlagCard(){
    flagCard.value = FlagCardType.getFlagCard(detectCCType(numberCardTyped.value));
  }

  numberCardEditing(String valueTyped){
    if(valueTyped == ""){
      numberCardTyped.value = "NÚMERO DO CARTÃO";
    }
    else {
      numberCardTyped.value = valueTyped;
    }
    _refreshFlagCard();
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

  cardTypeChanged({String? newType}){
    if(flipCardController.state != null && !flipCardController.state!.isFront) {
      flipCardController.toggleCard();
    }
    if(newType != null) {
      cardSelectedType.value = newType;
    }
    switch(cardSelectedType.value){
      case "Débito":
        cardImagePath.value = Paths.Debit_Card;
        break;
      case "Crédito":
        cardImagePath.value = Paths.Credit_Card;
        break;
      default:
        cardImagePath.value = Paths.Card_Not_Registered;
        break;
    }
  }

  reverseCard({String? newType}){
    if(flipCardController.state != null && flipCardController.state!.isFront) {
      flipCardController.toggleCard();
    }
    if(newType != null) {
      cardSelectedType.value = newType;
    }
    switch(cardSelectedType.value){
      case "Débito":
        cardImageBackPath.value = Paths.Debit_Card_Back;
        break;
      case "Crédito":
        cardImageBackPath.value = Paths.Credit_Card_Back;
        break;
      default:
        cardImageBackPath.value = Paths.Card_Not_Registered_Back;
        break;
    }
  }
}