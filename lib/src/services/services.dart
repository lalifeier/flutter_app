import 'hive_service.dart';

Future<void> initServices() async {
  print('starting services ...');

  // await Get.putAsync(() async => await HiveService.init());

  await HiveService.init();

  print('All services started...');
}
