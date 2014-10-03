part of boat_club;

/**
 * This is an Enum. Dart doesn't have built in enums yet and this is the standard way to fake one.
 */
class BoatType {
    static final SAILBOAT = const BoatType._(0);
    static final MOTORSAILOR = const BoatType._(1);
    static final MOTORBOAT = const BoatType._(2);
    static final CANOE = const BoatType._(3);
    static final OTHER = const BoatType._(4);

    static get values => [SAILBOAT, MOTORSAILOR, MOTORBOAT, CANOE, OTHER];

    final int value;

    int get hashCode => value.hashCode;

    const BoatType._(this.value);
    BoatType.fromValue(this.value);

    bool operator ==(BoatType other) {
        return value == other.value;
    }
}
