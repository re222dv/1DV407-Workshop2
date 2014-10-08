part of boat_club;

abstract class Repository {
    Db db;

    Repository(this.db);

    Future openDb() {
        if (db.state != State.OPEN) {
            return db.open();
        }

        return new Future.value(null);
    }
}
