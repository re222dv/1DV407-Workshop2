part of boat_club;

class BoatAdministerView {
    BoatView _boatView;

    BoatAdministerView(this._boatView);

    administer(Boat boat) {
        boat.type = _boatView.chooseType();

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
