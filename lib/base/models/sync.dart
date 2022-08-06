import 'base/coreEntity.dart';

class Sync extends CoreEntity {
  String? service;
  String? method;
  bool? success;
  String? message;
  late DateTime start;
  int? fullTime;

  Sync({
    this.service,
    this.method,
    this.success,
    this.message,
    required this.start,
    this.fullTime,
    DateTime? change,
  }) : super (lastChange: change);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['active'] = active;
    data['lastChange'] = lastChange;
    data['service'] = service;
    data['method'] = method;
    data['success'] = success;
    data['message'] = message;
    data['start'] = start;
    data['fullTime'] = fullTime;
    return data;
  }
}