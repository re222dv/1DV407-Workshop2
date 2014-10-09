part of boat_club;

class BoatAdministerView {

    administer(Boat boat) {/*
        while (true) {
            print('Set name: [${member.name}]');

            var input = stdin.readLineSync();
            if (input.isEmpty) {
                input = member.name;
            }
            try {
                member.name = input;
                break;
            } catch(_) {
                print('You must enter a name');
            }
        }*/
        boat.type = BoatType.CANOE;

        while (true) {
            print('Set length: [${boat.length}]');

            var input = stdin.readLineSync();
            if (input.isEmpty) {
                input = boat.length;
            }
            try {
                boat.length = double.parse(input);
                break;
            } catch(_) {
                print('Length must be a number');
            }
        }
    }
}
