part of boat_club;

class Member {
    static const NAME = 'name';
    static const SOCIAL_SECURITY_NUMBER = 'socialSecurityNumber';
    static const MEMBER_NUMBER = 'memberNumber';
    static const BOATS = 'boats';

    String name;
    String socialSecurityNumber;
    int memberNumber;
    List<Boat> boats = [];

    Member(this.name, this.socialSecurityNumber) {
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
        MEMBER_NUMBER: new BsonLong(memberNumber),
        BOATS: boats.map((boat) => boat.toJson()).toList(),
    };
}
