part of boat_club;

class MemberAdministerController {
    MemberRepository _memberRepository;
    MemberAdministerView _memberAdministerView;

    MemberAdministerController(this._memberRepository, this._memberAdministerView);

    run([Member member = null]) {
        if (member == null) {
            member = new Member.empty();
        }

        var oldMember = new Member.fromJson(member.toJson()); // Clone member
        _memberAdministerView.administer(member);

        return _memberRepository.save(oldMember, member);
    }
}
