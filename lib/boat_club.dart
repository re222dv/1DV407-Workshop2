library boat_club;

import 'dart:async';
import 'dart:io';
import 'package:di/di.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:optional/optional.dart';

part 'controller/BoatController.dart';
part 'controller/MainController.dart';
part 'controller/MemberController.dart';
part 'controller/MemberAdministerController.dart';
part 'controller/MemberListController.dart';

part 'model/entities/Boat.dart';
part 'model/entities/BoatType.dart';
part 'model/entities/Member.dart';

part 'model/repositories/MemberRepository.dart';
part 'model/repositories/Repository.dart';

part 'view/BoatView.dart';
part 'view/MainView.dart';
part 'view/MemberView.dart';
part 'view/MemberAdministerView.dart';
part 'view/MemberListView.dart';

class BoatClubModule extends Module {
    BoatClubModule() {
        bind(BoatController);
        bind(MainController);
        bind(MemberController);
        bind(MemberAdministerController);
        bind(MemberListController);

        bind(MemberRepository);

        bind(BoatView);
        bind(MainView);
        bind(MemberView);
        bind(MemberAdministerView);
        bind(MemberListView);
    }
}
