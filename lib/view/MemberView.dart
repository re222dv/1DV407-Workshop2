part of boat_club;

class MemberView {
    BoatView _boatView;

    MemberView(this._boatView);

    MainViewMenuItem getChosenMenuItem() {
        print('Enter the letter for the preffered action:');

        while (true) {
            var input = stdin.readLineSync();

            switch (input) {
                case 'e':
                case 'E':
                    return MemberViewMenuItem.EDIT;
                case 'd':
                case 'D':
                    return MemberViewMenuItem.DELETE;
                case 'r':
                case 'R':
                    return MemberViewMenuItem.RETURN;
                default:
                    print('The chosen action does not exist');
            }
        }
    }

    render(Member member) {
        print('\n${member.name}(${member.socialSecurityNumber}): ${member.memberNumber}');
        print('Boats:');
        member.boats.forEach((boat) => _boatView.render(boat));

        print('');
        print('Enter E to edit the member, D to delete or r to return');
    }
}

class MemberViewMenuItem {
    static const EDIT = const MemberViewMenuItem._(0);
    static const DELETE = const MemberViewMenuItem._(1);
    static const RETURN = const MemberViewMenuItem._(2);

    final int value;

    const MemberViewMenuItem._(this.value);
}
