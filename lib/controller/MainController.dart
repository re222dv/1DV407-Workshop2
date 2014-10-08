part of boat_club;

class MainController {
    MemberListController memberListController;
    MainView mainView;

    MainController(this.memberListController, this.mainView);

    run() {
        while (true) {
            mainView.render();

            switch (mainView.getChosenMenuItem()) {
                case MainViewMenuItem.COMPACT_LIST:
                    memberListController.run();
                    break;

                case MainViewMenuItem.DETAILED_LIST:
                    memberListController.run();
                    break;

                case MainViewMenuItem.QUIT:
                    return;

                default:
                    throw new UnimplementedError('The chosen menu item not implemented in MainController');
            }
        }
    }
}
