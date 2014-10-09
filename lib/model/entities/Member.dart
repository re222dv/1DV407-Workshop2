part of boat_club;

class Member {
    static const NAME = 'name';
    static const SOCIAL_SECURITY_NUMBER = 'socialSecurityNumber';
    static const MEMBER_NUMBER = 'memberNumber';
    static const BOATS = 'boats';

    String _name;
    String _socialSecurityNumber;
    int memberNumber;
    List<Boat> boats = [];

    String get name => _name;
    set name(String name) {
        if (name == null || name.trim().isEmpty) {
            throw new ArgumentError('Name can not be empty');
        }

        _name = name;
    }

    String get socialSecurityNumber => _socialSecurityNumber;
    set socialSecurityNumber(String socialSecurityNumber) {
        if (socialSecurityNumber == null || socialSecurityNumber.trim().isEmpty) {
            throw new ArgumentError('Social secutiry number can not be empty');
        }

        _socialSecurityNumber = socialSecurityNumber;
    }

    Member.empty() {
        _name = '';
        _socialSecurityNumber = '';
        memberNumber = new DateTime.now().millisecondsSinceEpoch;
    }

    Member.fromJson(Map memberJson) {
        name = memberJson[NAME];
        socialSecurityNumber = memberJson[SOCIAL_SECURITY_NUMBER];
        memberNumber = memberJson[MEMBER_NUMBER];

        memberJson[BOATS].forEach((boatJson) {
            boats.add(new Boat.fromJson(boatJson));
        });
    }

    Map toJson() => {
        NAME: name,
        SOCIAL_SECURITY_NUMBER: socialSecurityNumber,
        MEMBER_NUMBER: memberNumber,
        BOATS: boats.map((boat) => boat.toJson()).toList(),
    };
}
