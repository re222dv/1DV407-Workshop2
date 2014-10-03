part of boat_club;

class MemberView {
    BoatView _boatView;

    MemberView(this._boatView);

    render(Member member) {
        print('\n${member.name}(${member.socialSecurityNumber}): ${member.memberNumber}');
        print('Boats:');
        member.boats.forEach((boat) => _boatView.render(boat));
    }
}
