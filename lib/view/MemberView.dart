part of boat_club;

class MemberView {
    BoatView _boatView;

    MemberView(this._boatView);

    Boat getChosenBoat(List<Boat> boats) {
        while (true) {
            print('Enter number to select the corresponding boat:');

            var input = stdin.readLineSync();

            try {
                var chosenBoat = int.parse(input);
                if (chosenBoat < 1 || chosenBoat > boats.length) {
                    print('The chosen boat does not exist');
                } else {
                    return boats[chosenBoat - 1];
                }
            } on FormatException catch (_) {
                print('Please enter a number');
            }
        }
    }

    dynamic getChosenMenuItem() {
        print('Enter the letter for the preffered action '
              'or a number to select the corresponding boat:');

        while (true) {
            var input = stdin.readLineSync().toLowerCase();

            switch (input) {
                case 'e':
                    return MemberViewMenuItem.EDIT;
                case 'd':
                    return MemberViewMenuItem.DELETE;
                case 'ab':
                    return MemberViewMenuItem.ADD_BOAT;
                case 'eb':
                    return MemberViewMenuItem.EDIT_BOAT;
                case 'db':
                    return MemberViewMenuItem.DELETE_BOAT;
                case 'r':
                    return MemberViewMenuItem.RETURN;
                default:
                    print('The chosen action does not exist');
            }
        }
    }

    render(Member member) {
        var count = 0;

        print('\n${member.name}(${member.socialSecurityNumber}): ${member.memberNumber}');
        print('Boats:');
        member.boats.forEach((boat) {
            count += 1;
            _boatView.render(boat, '  $count. ');
        });

        print('\n');
        print('Enter E to edit or D to delete the member');
        print('Enter AB to add, ED to edit or DB to delete a boat');
        print('Enter R to return');
    }
}

class MemberViewMenuItem {
    static const EDIT = const MemberViewMenuItem._(0);
    static const DELETE = const MemberViewMenuItem._(1);
    static const ADD_BOAT = const MemberViewMenuItem._(2);
    static const EDIT_BOAT = const MemberViewMenuItem._(3);
    static const DELETE_BOAT = const MemberViewMenuItem._(4);
    static const RETURN = const MemberViewMenuItem._(5);

    final int value;

    const MemberViewMenuItem._(this.value);
}
