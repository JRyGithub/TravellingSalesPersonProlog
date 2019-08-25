/* 
Assignment Two
Joshua Ryland 5654548 jryl559

Travelling Salesperson Problem
['/Users/Gorilla Rig/Desktop/761/A2/a2.pl'].
['/Users/loqgar/Desktop/AI/TravellingSalesPersonProlog/a2.pl'].
*/

/*Dataset to be deleted yet, only for testing */
two_cities(RoadNetwork):-
    [
        (a, [(b,2)]),
        (b, [(a,1)])
    ] = RoadNetwork.

one_city(RoadNetwork):-
    [a, []] =RoadNetwork.

six_cities(RoadNetwork):-
    [
        (a, [(b, 5), (f, 6)]),
        (b, [(a, 5), (e, 1), (c, 4)]),
        (c, [(b, 4), (f, 9), (d, 2)]),
        (d, [(e, 3), (c, 2), (f, 7)]),
        (e, [(b, 1), (d, 2)]),
        (f, [(a, 6), (c, 9), (d, 7)])
    ] = RoadNetwork.
/* 

Logic:
Using a given road network and starting city, work out all paths to see every city once and then return to the starting city
Return total cost of each path and the path itself.

*/

len([], 0).
len([H|T], N):- len(T, X), N is X+1 .

solution([StartCity], RoadNetwork, Cost, Path):-
    solution([StartCity],RoadNetwork,[StartCity], 0,Cost,Path).

solution([StartCity],RoadNetwork, Visited, CostAcc, TotalCost, Path):-
    member((StartCity, NeighbourCities), RoadNetwork),
    member((StopCity, Cost), NeighbourCities),
    NewCost is CostAcc + Cost,
	not(member(StopCity,Visited)),
    solution([StopCity], RoadNetwork,[StopCity|Visited], NewCost, TotalCost, Path).

solution([City], RoadNetwork, Visited, TotalCost ,Cost, Path):-
    member((City,Roads), RoadNetwork),
    member((Finish,Price), Roads),
    reverse([Finish|Visited],Path),
    len(Visited, Q),
    (Q=6 -> Cost is TotalCost + Price).




/* DELETE THIS PURELY FOR TESTING SOLUTION SHOULD COME WHEN THIS IS CALLED
optimalSolution(+StartCity, +RoadNetwork, -OptimalCost, -Solution) 
return the optimal solution cost and path
six_cities(R), member((a,K),R), member((I, Cost), K).
the abpove query actually gets the cost
*/

optimalSolution(StartCity, RoadNetwork, OptimalCost, SolutionPath) :-
    findall(solution(Cost, Path), solution([StartCity], RoadNetwork, Cost, Path), Solutions),
    sort(Solutions, SortedSolutions),
    SortedSolutions = [solution(OptimalCost, SolutionPath) | _].