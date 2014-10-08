part of boat_club;

class MainView {

    MainViewMenuItem getChosenMenuItem() {
        print('Enter a number for the menu item:');

        while (true) {
            var input = stdin.readLineSync();

            switch (input) {
                case '1':
                    return MainViewMenuItem.COMPACT_LIST;
                case '2':
                    return MainViewMenuItem.DETAILED_LIST;
                case 'q':
                case 'Q':
                    return MainViewMenuItem.QUIT;
                default:
                    print('The chosen menu item does not exist');
            }
        }
    }

    render() {
        print('''
The boat club GladaPiratens membersystem

1. Compact Member List
2. Detaild Member List

Q. Quit
        ''');
    }
}

class MainViewMenuItem {
    static const COMPACT_LIST = const MainViewMenuItem._(0);
    static const DETAILED_LIST = const MainViewMenuItem._(1);
    static const QUIT = const MainViewMenuItem._(2);

    static get values => [COMPACT_LIST, DETAILED_LIST];

    final int value;

    const MainViewMenuItem._(this.value);
}
