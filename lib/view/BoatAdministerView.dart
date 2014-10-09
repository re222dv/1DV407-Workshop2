part of boat_club;

class BoatAdministerView {
    BoatView _boatView;

    BoatAdministerView(this._boatView);

    administer(Boat boat) {
        boat.type = _boatView.chooseType();

        while (true) {
            if (boat.length) {
                print('Set length in meters:');
            } else {
                print('Set length in meters: [${boat.length}]');
            }

            var input = stdin.readLineSync();
            if (input.isEmpty) {
                input = boat.length.toString();
            }
            try {
                boat.length = double.parse(input);
                break;
            } on FormatException catch(_) {
                print('Length must be a number');
            }
        }
    }
}
