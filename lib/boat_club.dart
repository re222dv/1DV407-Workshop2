library boat_club;

import 'dart:async';
import 'package:di/di.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'controller/BoatController.dart';
part 'controller/MasterController.dart';
part 'controller/MemberController.dart';

part 'model/entities/Boat.dart';
part 'model/entities/BoatType.dart';
part 'model/entities/Member.dart';

part 'model/repositories/MemberRepository.dart';
part 'model/repositories/Repository.dart';

class BoatClubModule extends Module {
    BoatClubModule() {
        bind(BoatController);
        bind(MasterController);
        bind(MemberController);

        bind(MemberRepository);
    }
}
