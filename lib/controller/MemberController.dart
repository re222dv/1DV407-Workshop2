part of boat_club;

class MemberController {
    BoatAdministerController _boatAdministerController;
    MemberAdministerController _memberAdministerController;
    MemberView _memberView;

    MemberController(this._boatAdministerController,
                     this._memberAdministerController,
                     this._memberView);

    run(Member member) =>
        /*
            Loop until false is returned by the callback. If the callback returns
            a future, it waits for it to complete before using its result.
         */
        Future.doWhile(() {
            _memberView.render(member);

            switch (_memberView.getChosenMenuItem()) {
                case MemberViewMenuItem.EDIT:
                    return _memberAdministerController.run(member).then((_) => true);
                    /*
                        Continue looping by returning true when the run completes
                     */

                case MemberViewMenuItem.DELETE:
                    return _memberAdministerController.delete(member).then((_) => false);
                    /*
                        Stop looping by returning false when delete completes
                     */

                case MemberViewMenuItem.ADD_BOAT:
                    return _boatAdministerController.add(member).then((_) => false);

                case MemberViewMenuItem.RETURN:
                    return false;

                default:
                    throw new UnimplementedError('The chosen menu item is not implemented in MemberController');
            }
        });
}
