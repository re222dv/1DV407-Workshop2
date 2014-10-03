part of boat_club;

class MemberListController {
    MemberController _memberController;
    MemberListView _memberListView;
    MemberRepository _memberRepository;

    MemberListController(this._memberController, this._memberListView, this._memberRepository);

    run() {
        _memberRepository.getAll().then((memberList) {
            while(true) {
                _memberListView.renderDetailed(memberList);

                var member = _memberListView.getChosenMember(memberList.toList());
                _memberController.run(member);
            }
        });
    }
}
