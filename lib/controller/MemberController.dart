part of boat_club;

class MemberController {
    BoatAdministerController _boatAdministerController;
    MemberAdministerController _memberAdministerController;
    MemberView _memberView;

    MemberController(this._boatAdministerController,
                     this._memberAdministerController,
                     this._memberView);

    Future run(Member member) =>
        /*
            Loop until false is returned by the callback. If the callback returns
            a future, it waits for it to complete before using its result.
         */
        Future.doWhile(() {
            _memberView.render(member);

            switch (_memberView.getChosenMenuItem()) {
                case MemberViewMenuItem.EDIT:
                    return _memberAdministerController.update(member).then((_) => true);
                    // Continue looping by returning true when run completes

                case MemberViewMenuItem.DELETE:
                    return _memberAdministerController.delete(member).then((_) => false);
                    // Stop looping by returning false when delete completes

                case MemberViewMenuItem.ADD_BOAT:
                    return _boatAdministerController.add(member).then((_) => true);
                    // Continue looping by returning true when add completes

                case MemberViewMenuItem.EDIT_BOAT:
                    var boat = _memberView.getChosenBoat(member.boats);
                    if (boat != null) {
                        return _boatAdministerController.update(member, boat).then((_) => true);
                        // Continue looping by returning true when update completes
                    }
                    return true; // Continue looping by returning true

                case MemberViewMenuItem.DELETE_BOAT:
                    var boat = _memberView.getChosenBoat(member.boats);
                    if (boat != null) {
                        return _boatAdministerController.delete(member, boat).then((_) => true);
                        // Continue looping by returning true when update completes
                    }
                    return true; // Continue looping by returning true

                case MemberViewMenuItem.RETURN:
                    return false; // Stop looping by returning false

                default:
                    throw new UnimplementedError('The chosen menu item is not implemented in MemberController');
            }
        });
}
