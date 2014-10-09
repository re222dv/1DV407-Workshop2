part of boat_club;

class MainController {
    MemberAdministerController _memberAdministerController;
    MemberListController _memberListController;
    MainView _mainView;

    MainController(this._memberAdministerController, this._memberListController, this._mainView);

    run() =>
        /*
            Loop until false is returned by the callback. If the callback returns
            a future, it waits for it to complete before using its result.
         */
        Future.doWhile(() {
            _mainView.render();

            switch (_mainView.getChosenMenuItem()) {
                case MainViewMenuItem.COMPACT_LIST:
                    return _memberListController.run()
                        .then((_) => CONTINUE_LOOP);

                case MainViewMenuItem.DETAILED_LIST:
                    return _memberListController.run(detailed: true)
                        .then((_) => CONTINUE_LOOP);

                case MainViewMenuItem.NEW_MEMBER:
                    return _memberAdministerController.add()
                        .then((_) => CONTINUE_LOOP);

                case MainViewMenuItem.QUIT:
                    exit(0);

                default:
                    throw new UnimplementedError('The chosen menu item is not implemented in MainController');
            }
        });
}
