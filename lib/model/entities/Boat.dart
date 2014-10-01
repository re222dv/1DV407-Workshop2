part of boat_club;

class Boat {
    static const TYPE = 'type';
    static const LENGTH = 'length';

    BoatType type;
    num length;

    Boat(this.type, this.length);

    Boat.fromJson(Map boatJson) {
        type = new BsonInt(new BoatType.fromValue(boatJson[TYPE]));
        length = new BsonDouble(boatJson[LENGTH]);
    }

    Map toJson() => {
        TYPE: type.value,
        LENGTH: length,
    };
}
