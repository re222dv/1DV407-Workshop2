part of boat_club;

class MemberAdministerController {
    MemberRepository _memberRepository;
    MemberAdministerView _memberAdministerView;

    MemberAdministerController(this._memberRepository, this._memberAdministerView);

    run([Member member = null]) {
        var creating = false;
        var oldMember;

        if (member == null) {
            member = new Member.empty();
            creating = true;
        } else {
            var oldMember = new Member.fromJson(member.toJson()); // Clone member
        }

        _memberAdministerView.administer(member);

        if (creating) {
            return _memberRepository.add(member);
        } else {
            return _memberRepository.update(oldMember, member);
        }
    }

    delete(Member member) => _memberRepository.delete(member);
}
