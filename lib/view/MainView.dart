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
                case '3':
                    return MainViewMenuItem.NEW_MEMBER;
                case 'q':
                case 'Q':
                    exit(0);
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
3. Create New Member

Q. Quit
        ''');
    }
}

class MainViewMenuItem {
    static const COMPACT_LIST = const MainViewMenuItem._(0);
    static const DETAILED_LIST = const MainViewMenuItem._(1);
    static const NEW_MEMBER = const MainViewMenuItem._(2);
    static const QUIT = const MainViewMenuItem._(3);

    final int value;

    const MainViewMenuItem._(this.value);
}
