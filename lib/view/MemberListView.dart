part of boat_club;

class MemberListView {

    BoatView _boatView;

    MemberListView(this._boatView);

    Optional<Member> getChosenMember(List<Member> memberList) {
        print('Enter a number to view coresponding member or R to return:');

        var input;
        var validInput = false;

        do {
            input = stdin.readLineSync().toLowerCase();

            if (input == 'r') {
                return new Optional.empty();
            }

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

        return new Optional.of(memberList[input - 1]);
    }

    renderCompact(Iterable<Member> memberList) {
        var count = 0;

        print('  #                 Name        Member Number     Boats\n');

        memberList.forEach((member) {
            count += 1;
            print('${count.toString().padLeft(3)} '
                  '${member.name.padLeft(20)} '
                  '${member.memberNumber.toString().padLeft(20)} '
                  '${member.boats.length.toString().padLeft(5)}');
        });

        print('');
    }

    renderDetailed(Iterable<Member> memberList) {
        var count = 0;
        memberList.forEach((member) {
            count += 1;
            print('$count. ${member.name}(${member.socialSecurityNumber}): ${member.memberNumber}');

            member.boats.forEach((boat) => _boatView.render(boat, '    '));

            print('');
        });
    }
}
