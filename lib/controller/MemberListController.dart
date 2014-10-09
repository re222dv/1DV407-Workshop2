part of boat_club;

class MemberListController {
    MemberController _memberController;
    MemberListView _memberListView;
    MemberRepository _memberRepository;

    MemberListController(this._memberController, this._memberListView, this._memberRepository);

    Future run({bool detailed: false}) =>
        /*
            Loop until false is returned by the callback. If the callback returns
            a future, it waits for it to complete before using its result.
         */
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
                    // Continue looping by returning true when run completes
                } else {
                    return false; // Stop looping by returning false
                }
            })
        );
}
