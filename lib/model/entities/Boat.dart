part of boat_club;

class Boat {
    static const TYPE = 'type';
    static const LENGTH = 'length';

    BoatType type;
    num length;

    Boat.empty();

    Boat.fromJson(Map boatJson) {
        type = new BoatType.fromValue(boatJson[TYPE]);
        length = boatJson[LENGTH];
    }

    Map toJson() => {
        TYPE: type.value,
        LENGTH: length,
    };
}
