part of boat_club;

class BoatAdministerController {
    MemberRepository _memberRepository;
    BoatAdministerView _boatAdministerView;

    BoatAdministerController(this._memberRepository, this._boatAdministerView);

    add(Member member) {
        var oldMember = new Member.fromJson(member.toJson()); // Clone member
        var boat = new Boat.empty();

        _boatAdministerView.administer(boat);
        member.boats.add(boat);

        return _memberRepository.update(oldMember, member);
    }

    update(Member member, Boat boat) {
        var oldMember = new Member.fromJson(member.toJson()); // Clone member

        _boatAdministerView.administer(member);

        return _memberRepository.update(oldMember, member);
    }

    delete(Member member, Boat boat) {
        var oldMember = new Member.fromJson(member.toJson()); // Clone member

        member.boats.remove(boat);

        return _memberRepository.update(oldMember, member);
    }
}
