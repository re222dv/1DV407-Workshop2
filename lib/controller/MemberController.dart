part of boat_club;

class MemberController {
    MemberAdministerController _memberAdministerController;
    MemberView _memberView;

    MemberController(this._memberAdministerController, this._memberView);

    run(Member member) =>
        Future.doWhile(() {
            _memberView.render(member);

            switch (_memberView.getChosenMenuItem()) {
                case MemberViewMenuItem.EDIT:
                    return _memberAdministerController.run(member).then((_) => true);

                case MemberViewMenuItem.DELETE:
                    return _memberAdministerController.delete(member).then((_) => false);

                case MemberViewMenuItem.RETURN:
                    return false;

                default:
                    throw new UnimplementedError('The chosen menu item is not implemented in MemberController');
            }
        });
}
