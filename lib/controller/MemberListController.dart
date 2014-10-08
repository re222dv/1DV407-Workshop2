part of boat_club;

class MemberListController {
    MemberController _memberController;
    MemberListView _memberListView;
    MemberRepository _memberRepository;

    MemberListController(this._memberController, this._memberListView, this._memberRepository);

    run({bool detailed: false}) =>
        Future.doWhile(() =>
            _memberRepository.getAll().then((memberList) {
                if (detailed) {
                    _memberListView.renderDetailed(memberList);
                } else {
                    _memberListView.renderCompact(memberList);
                }

                var member = _memberListView.getChosenMember(memberList.toList());

                if (member.isPresent) {
                    return _memberController.run(member.value).then((_) => true);
                } else {
                    return;
                }
            })
        );
}
