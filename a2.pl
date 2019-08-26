/* 
Assignment Two
Joshua Ryland 5654548 jryl559

Travelling Salesperson Problem
*/
/*Dataset for testing
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
*/
/* 

Logic:
Using a given road network and starting city, work out all paths to see every city once and then return to the starting city
Return total cost of each path and the path itself.

*/

len([], 0).
len([H|T], N):- len(T, X), N is X+1 .

solution([Path], RoadNetwork, SolutionCost, SolutionPath):-
    solution([Path],RoadNetwork,[Path], 0,SolutionCost,SolutionPath).

solution([Path],RoadNetwork, Visited, CostAcc, TotalCost, SolutionPath):-
    member((Path, NeighbourCities), RoadNetwork),
    member((StopCity, SolutionCost), NeighbourCities),
    NewCost is CostAcc + SolutionCost,
	not(member(StopCity,Visited)),
    solution([StopCity], RoadNetwork,[StopCity|Visited], NewCost, TotalCost, SolutionPath).

solution([City], RoadNetwork, Visited, TotalCost ,SolutionCost, SolutionPath):-
    member((City,Roads), RoadNetwork),
    member((Finish,Price), Roads),
    reverse([Finish|Visited],SolutionPath),
    [First|_] = SolutionPath,
    append(_,[Last],SolutionPath),
    First = Last,
    len(Visited, Q),
    (Q=6 -> SolutionCost is TotalCost + Price).
