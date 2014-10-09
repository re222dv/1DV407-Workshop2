part of boat_club;

class MemberRepository extends Repository {
    static const COLLECTION_NAME = 'memberRegister';

    MemberRepository(Db db):super(db);

    Map _databaseSecure(Map json) {
        Map secure = {};

        json.keys.forEach((key) {
            var value = json[key];
            if (value is int) {
                secure[key] = new BsonLong(value);
            } else {
                secure[key] = value;
            }
        });

        return secure;
    }

    Future add(Member member) =>
        openDb()
            .then((_) =>
                db.collection(COLLECTION_NAME).insert(_databaseSecure(member.toJson())));

    Future delete(Member member) =>
        openDb()
            .then((_) =>
                db.collection(COLLECTION_NAME).remove(member.toJson()));

    Future update(Member oldMember, Member updatedMember) {
        print(_databaseSecure(oldMember.toJson()));
        print(_databaseSecure(updatedMember.toJson()));
        return openDb()
            .then((_) =>
                db.collection(COLLECTION_NAME).update(_databaseSecure(oldMember.toJson()),
                                                      _databaseSecure(updatedMember.toJson())));
    }

    Future<Iterable<Member>> getAll() =>
        openDb()
            .then((_) {
                var members = [];

                return db.collection(COLLECTION_NAME)
                    .find()
                        .forEach((memberJson) => members.add(new Member.fromJson(memberJson)))
                        .then((_) => members);
            });
}
