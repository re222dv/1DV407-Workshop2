part of boat_club;

class Boat {
    static const TYPE = 'type';
    static const LENGTH = 'length';

    BoatType type;
    num length;

    Boat(this.type, this.length);

    Boat.fromJson(Map boatJson) {
        type = new BoatType.fromValue(boatJson[TYPE]);
        length = boatJson[LENGTH];
    }

    Map toJson() => {
        TYPE: new BsonInt(type.value),
        LENGTH: new BsonDouble(length),
    };
}
