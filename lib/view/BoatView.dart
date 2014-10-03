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

    render(Boat boat) {
        print('    ${_BOAT_TYPE_NAMES[boat.type]}: ${boat.length}m');
    }
}
