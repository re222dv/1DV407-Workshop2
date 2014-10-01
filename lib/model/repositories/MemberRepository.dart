part of boat_club;

class MemberRepository extends Repository {
    static const COLLECTION_NAME = 'memberRegister';

    MemberRepository(Db db):super(db);

    add(Member member) {
        db.open()
            .then((_) =>
                db.collection(COLLECTION_NAME).insert(member.toJson()))
            .then((_) => db.close());
    }

    Future<Iterable<Member>> getAll() =>
        db.open().then((_) {
            var members = [];

            return db.collection(COLLECTION_NAME)
                .find()
                    .forEach((memberJson) => members.add(new Member.fromJson(memberJson)))
                    .then((_) => members);
        });
}
