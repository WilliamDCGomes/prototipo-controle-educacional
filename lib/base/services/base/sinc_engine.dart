import 'package:projeto_tcc/base/models/sync.dart';
import '../interfaces/ibase_service_get.dart';
import '../interfaces/ibase_service_post_and_get.dart';

class SincEngine {
  Future<List<Sync>> starSync(List<IBaseServicePostAndGet>? servicesPost, List<IBaseServiceGet>? servicesGet) async {
    List<Sync> syncList = [];

    if (servicesPost != null) {
      for (var item in servicesPost) {
        Sync sync = Sync(
          start: DateTime.now(),
          change: DateTime.now(),
          service: item.runtimeType.toString(),
          method: item.nomeMetodo,
        );
        try {
          await item.postMethod();
          sync.success = true;
          sync.message = "Sincronizado com sucesso";
          sync.lastChange = DateTime.now();
        } catch (e) {
          sync.success = false;
          sync.message = e.toString();
          sync.lastChange = DateTime.now();
        }
        sync.fullTime = (sync.lastChange?.difference(sync.start).inSeconds ?? -1);
        syncList.add(sync);
      }
    }

    if (servicesGet != null) {
      for (var item in servicesGet) {
        Sync sync = Sync(
          start: DateTime.now(),
          change: DateTime.now(),
          service: item.runtimeType.toString(),
          method: item.nomeMetodo,
        );
        try {
          await item.getAll();
          sync.success = true;
          sync.message = "Sincronizado com sucesso";
          sync.lastChange = DateTime.now();
        } catch (e) {
          sync.success = false;
          sync.message = e.toString();
          sync.lastChange = DateTime.now();
        }
        sync.fullTime = (sync.lastChange?.difference(sync.start).inSeconds ?? -1);
        syncList.add(sync);
      }
    }

    return syncList;
  }
}
