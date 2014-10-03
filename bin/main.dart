import 'package:di/di.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:ooad-w2/boat_club.dart';

main() {
    var db = new Db('mongodb://ooad:ooad@ds063929.mongolab.com:63929/ooadw2');

    var injector = new ModuleInjector([
            new BoatClubModule()
                ..bind(Db, toValue: db)
        ]);

    MemberListController memberListController = injector.get(MemberListController);
    memberListController.run();
    //test.add(new Member('Rasmus', 'test')..boats.add(new Boat(BoatType.MOTORBOAT, 6.5)));
    /*test.getAll().then((members) => members.forEach((member) {
        print ('Member ${member.name} ${member.socialSecurityNumber} ${member.memberNumber}');
    }));*/
}
