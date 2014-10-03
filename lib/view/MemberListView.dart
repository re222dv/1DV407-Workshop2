part of boat_club;

class MemberListView {

    BoatView _boatView;

    MemberListView(this._boatView);

    Member getChosenMember(List<Member> memberList) {
        print('Enter a number to view coresponding member:');

        var input;
        var validInput = false;

        do {
            input = stdin.readLineSync();

            try {
                input = int.parse(input);
            } on FormatException catch (_) {
                print('You need to write a number');
                continue;
            }

            if (input > 0 || input <= memberList.length) {
                validInput = true;
            } else {
                print('The chosen number is outside of the range');
            }
        } while(!validInput);

        return memberList[input - 1];
    }

    renderCompact(Iterable<Member> memberList) {
        memberList.forEach((member) {
            print('${member.name}: ${member.memberNumber} ${member.boats.length}');
        });
    }

    renderDetailed(Iterable<Member> memberList) {
        var count = 0;
        memberList.forEach((member) {
            count += 1;
            print('\n$count. ${member.name}(${member.socialSecurityNumber}): ${member.memberNumber}');

            member.boats.forEach((boat) => _boatView.render(boat));
        });
    }
}
