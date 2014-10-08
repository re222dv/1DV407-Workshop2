part of boat_club;

class MemberAdministerView {
    BoatView _boatView;

    MemberAdministerView(this._boatView);

    administer(Member member) {
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
        }

        while (true) {
            print('Set social security number: [${member.socialSecurityNumber}]');

            var input = stdin.readLineSync();
            if (input.isEmpty) {
                input = member.socialSecurityNumber;
            }
            try {
                member.socialSecurityNumber = input;
                break;
            } catch(_) {
                print('You must enter a social security number');
            }
        }
    }
}
