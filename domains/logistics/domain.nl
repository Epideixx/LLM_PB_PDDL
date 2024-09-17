In this domain, there are six different types of objects: "object" (the packages to be transported), "truck", "airplane" and their common supertype "vehicle", "location" and the subtype "airport", and finally "city". Types are defined by static (in the sense that there are no operators that change their truth value) unary predicates.
The types of objects in a problem instance must be defined by including the appropriate typing predicates in the initial state.

A binary static predicate called "loc" describes the topology of the problem instance: "(loc ?l ?c)" is true iff the location ?l is in city ?c.

There are four actions: one for loading packages, one for unloading packages, one for driving a truck between two locations in the same city and one to fly an airplane between two airports
By declaring all trucks and airplanes to be also "vehicle", we can use the same load/unload operator for both (otherwise we would need one for each subtype of vehicle).
By declaring all locations, including airports, to be of type"location", we can use only one driving operator (otherwise, we would again need one for each case, i.e. one for from-location- to-airport, one for from-location-to-location, etc. Very unnecessay).