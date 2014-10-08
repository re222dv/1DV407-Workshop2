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
    }

    Future save(Member oldMember, Member updatedMember) {
        return openDb()
            .then((_) =>
                db.collection(COLLECTION_NAME).update({Member.MEMBER_NUMBER: oldMember.memberNumber},
                                                      updatedMember.toJson(),
                                                      upsert: true));
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
