part of boat_club;

class MemberController {
    MemberView _memberView;

    MemberController(this._memberView);

    run(Member member) {
        _memberView.render(member);
    }
}
