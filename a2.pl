/* 
Assignment Two
Joshua Ryland 5654548 jryl559

Travelling Salesperson Problem
['/Users/Gorilla Rig/Desktop/761/A2/a2.pl'].
*/
dsd
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

solution([StartCity], RoadNetwork, Cost, Path):-
    
    
    

/* DELETE THIS PURELY FOR TESTING SOLUTION SHOULD COME WHEN THIS IS CALLED
optimalSolution(+StartCity, +RoadNetwork, -OptimalCost, -Solution) 
return the optimal solution cost and path
*/

optimalSolution(StartCity, RoadNetwork, OptimalCost, SolutionPath) :-
    findall(solution(Cost, Path), solution([StartCity], RoadNetwork, Cost, Path), Solutions),
    sort(Solutions, SortedSolutions),
    SortedSolutions = [solution(OptimalCost, SolutionPath) | _].