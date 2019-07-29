

def greedyAlgorithm(statesNeeded, stations):
    finalStations = set()
    while statesNeeded: # Loop while we still need to cover states
        bestStation = None
        statesCovered = set()
        # Loop over all states to find the best station that coveres the most currently uncovered states
        for station, states in stations.items():
            covered = statesNeeded & states # "covered" is the set of uncovered states that this stations covers
            if len(covered) > len(statesCovered): # If the current station coveres more states, then the current bast,
                bestStation = station # set this station as the current best
                statesCovered = covered # and updates the "statesCovered" to the states that this station covers.
        statesNeeded -= statesCovered # Updates "statesNeeded" by removing all stations included in the selected "bestStation"
        finalStations.add(bestStation) # Add best station to the final list of stations
    return finalStations


def init():
    statesNeeded = set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"])
    stations = dict()
    stations["kone"] = set(["id", "nv", "ut"])
    stations["ktwo"] = set(["wa", "id", "mt"])
    stations["kthree"] = set(["or", "nv", "ca"])
    stations["kfour"] = set(["nv", "ut"])
    stations["kfive"] = set(["ca", "az"])

    return statesNeeded, stations


def main():
    # Trying to find the combination of radio stations that allow us to reach all the states
    # listed in statesNeeded
    statesNeeded, stations = init()
    finalSetOfStations = greedyAlgorithm(statesNeeded, stations)
    print("STATIONS NEEDED: " + str(finalSetOfStations))


if __name__ == "__main__":
    main()