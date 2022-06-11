import 'coreEntity.dart';

class CoreSendEntity extends CoreEntity{
  //#region Atributos
  /// <summary>
  /// Data do sincronismo
  /// [SINCRONISMO]
  /// </summary>
  late DateTime? lastSync;

  /// <summary>
  /// Flag de enviado
  /// [SINCRONIZADO]
  /// </summary>
  late bool synced;
  //#endregion

  //#region Construtor
  CoreSendEntity(){
    lastSync = null;
    synced = true;
  }
  //#endregion

  //#region Conversões
  CoreSendEntity.fromJson(Map<String, dynamic> json) {
    lastSync = json["lastSync"];
    synced = json["synced"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["lastSync"] = this.lastSync;
    data["synced"] = this.synced;
    return data;
  }
  //#endregion
}