part of boat_club;

class MemberListView {
    BoatView _boatView;

    MemberListView(this._boatView);

    renderCompact(Iterable<Member> memberList) {
        memberList.forEach((member) {
            print('${member.name}: ${member.memberNumber} ${member.boats.length}');
        });
    }

    renderDetailed(Iterable<Member> memberList) {
        memberList.forEach((member) {
            print('\n${member.name}(${member.socialSecurityNumber}):' '${member.memberNumber}');

            member.boats.forEach((boat) => _boatView.render(boat));
        });
    }
}
