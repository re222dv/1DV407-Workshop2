part of boat_club;

class MemberListController {
    MemberController _memberController;
    MemberListView _memberListView;
    MemberRepository _memberRepository;

    MemberListController(this._memberController, this._memberListView, this._memberRepository);

    run({bool detailed: false}) =>
        _memberRepository.getAll().then((memberList) {
            while(true) {
                if (detailed) {
                    _memberListView.renderDetailed(memberList);
                } else {
                    _memberListView.renderCompact(memberList);
                }

                var member = _memberListView.getChosenMember(memberList.toList());

                if (member.isPresent) {
                    _memberController.run(member.value);
                } else {
                    return;
                }
            }
        });
}
