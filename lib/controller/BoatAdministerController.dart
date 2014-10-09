part of boat_club;

class BoatAdministerController {
    MemberRepository _memberRepository;
    BoatAdministerView _boatAdministerView;

    BoatAdministerController(this._memberRepository, this._boatAdministerView);

    add(Member member) {
        var oldMember = member.clone();
        var boat = new Boat.empty();

        _boatAdministerView.administer(boat);
        member.boats.add(boat);

        return _memberRepository.update(oldMember, member);
    }

    update(Member member, Boat boat) {
        var oldMember = member.clone();

        _boatAdministerView.administer(boat);

        return _memberRepository.update(oldMember, member);
    }

    delete(Member member, Boat boat) {
        var oldMember = member.clone();

        member.boats.remove(boat);

        return _memberRepository.update(oldMember, member);
    }
}
