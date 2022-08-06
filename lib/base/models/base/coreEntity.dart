import 'package:uuid/uuid.dart';

class CoreEntity{
  //#region Atributos
  /// <summary>
  /// Primary key da tabela
  /// [ID]
  /// [PrimaryKey]
  /// </summary>
  late String id;

  /// <summary>
  /// Data de inclusão do registro
  /// [ALTERACAO]
  /// </summary>
  late DateTime? lastChange;

  /// <summary>
  /// Data de inclusão do registro
  /// [INCLUSAO]
  /// </summary>
  late DateTime? includeDate;

  /// <summary>
  /// Flag de ativo
  /// [ATIVO]
  /// </summary>
  late bool active;
  //#endregion

  //#region Construtor
  CoreEntity({this.lastChange}){
    id = Uuid().v4();
    lastChange ??= DateTime.now();
    includeDate = DateTime.now();
    active = true;
  }
  //#endregion

  //#region Conversões
  CoreEntity.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}