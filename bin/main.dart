import 'package:di/di.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:ooad-w2/boat_club.dart';

main() {
    var db = new Db('mongodb://ooad:ooad@ds063929.mongolab.com:63929/ooadw2');

    var injector = new ModuleInjector([
            new BoatClubModule()
                ..bind(Db, toValue: db)
        ]);

    var mainController = injector.get(MainController);
    mainController.run();
}
