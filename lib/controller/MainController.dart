part of boat_club;

class MainController {
    MemberListController _memberListController;
    MainView _mainView;

    MainController(this._memberListController, this._mainView);

    run() =>
        Future.doWhile(() {
            _mainView.render();

            switch (_mainView.getChosenMenuItem()) {
                case MainViewMenuItem.COMPACT_LIST:
                    return _memberListController.run().then((_) => true);

                case MainViewMenuItem.DETAILED_LIST:
                    return _memberListController.run(detailed: true).then((_) => true);

                case MainViewMenuItem.QUIT:
                    return false;

                default:
                    throw new UnimplementedError('The chosen menu item not implemented in MainController');
            }
        });
}
