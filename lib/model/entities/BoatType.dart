part of boat_club;

/**
 * This is an Enum. Dart doesn't have built in enums yet and this is the standard way to fake one.
 */
class BoatType {
    static final SAILBOAT = new BoatType._(0);
    static final MOTORSAILOR = new BoatType._(1);
    static final MOTORBOAT = new BoatType._(2);
    static final CANOE = new BoatType._(3);
    static final OTHER = new BoatType._(4);

    int value;

    int get hashCode => value.hashCode;

    BoatType._(this.value);
    BoatType.fromValue(this.value);

    bool operator ==(BoatType other) {
        return value = other.value;
    }
}
