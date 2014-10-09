part of boat_club;

class MemberAdministerController {
    MemberRepository _memberRepository;
    MemberAdministerView _memberAdministerView;

    MemberAdministerController(this._memberRepository, this._memberAdministerView);

    Future add() {
        var member = new Member.empty();

        _memberAdministerView.administer(member);

        return _memberRepository.add(member);
    }

    Future update(Member member) {
        var oldMember = member.clone();

        _memberAdministerView.administer(member);

        return _memberRepository.update(oldMember, member);
    }

    Future delete(Member member) => _memberRepository.delete(member);
}
