part of boat_club;

class BoatView {
    static final _BOAT_TYPE_NAMES = {
        BoatType.SAILBOAT: 'Sailboat',
        BoatType.MOTORSAILOR: 'Motorsailor',
        BoatType.MOTORBOAT: 'Motorboat',
        BoatType.CANOE: 'Canoe',
        BoatType.OTHER: 'Other',
    };

    BoatView() {
        if (_BOAT_TYPE_NAMES.length != BoatType.values.length) {
            throw new Exception('BOAT_TYPE_NAMES.length must be equal to BoatType.length');
        }
    }

    BoatType chooseType() {
        while (true) {
            var count = 0;

            _BOAT_TYPE_NAMES.values.forEach((type) {
                count += 1;
                print('$count. $type');
            });

            print('Enter boattype: ');

            var input = stdin.readLineSync();
            try {
                var pick = int.parse(input);

                if (pick < 1 || pick > _BOAT_TYPE_NAMES.length) {
                    print("The selected boattype don't exist");
                } else {
                    return _BOAT_TYPE_NAMES.keys.toList()[pick - 1];
                }
            } on FormatException catch (_) {
                print('Enter the number corresponding to the boattype');
            }
        }
    }

    render(Boat boat) {
        print('    ${_BOAT_TYPE_NAMES[boat.type]}: ${boat.length} m');
    }
}
