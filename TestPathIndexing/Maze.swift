//
//  Maze.swift
//  TestPathIndexing
//
//  Created by Test on 13/02/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class Maze {
    
    
    static let dimensions = 31
    /// A grid-based graph representing the navigability space of the maze.
    var graph: GKGridGraph<GKGridGraphNode>
    
    /// A node in a grid-based graph representing the starting point of the maze.
    var startNode: GKGridGraphNode
    
    /// A node in a grid-based graph representing the ending point of the maze.
    var endNode: GKGridGraphNode
    
    /**
     Computes a solution to the maze by using GameplayKit's pathfinding
     on the maze's GKGridGraph.
     */
    var solutionPath: [GKGridGraphNode]? {
        // Calculate a solution path to the maze.
        let solution = graph.findPath(from: startNode, to: endNode) as! [GKGridGraphNode]
        
        /*
         If the solution path is not empty, return the path. Otherwise,
         throw an error.
         */
        if solution.isEmpty {
            assertionFailure("No path exists between startNode and endNode.")
            return nil
        }
        else {
            return solution
        }
    }
    
    // MARK: Initialization
    
    init() {
        // Initialize the maze graph. At this point, the graph has no walls.
        graph = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(Maze.dimensions), height: Int32(Maze.dimensions), diagonalsAllowed: false)
        
        /*
         Define the maze's start and end nodes.
         
         - Note: These nodes must have both an even x and an even y
         coordinate, otherwise they may not remain on the maze graph after
         the maze walls are removed.
         */
        startNode = graph.node(atGridPosition: int2(0, Int32(Maze.dimensions - 1)))!
        endNode   = graph.node(atGridPosition: int2(Int32(Maze.dimensions - 1), 0))!
        
        /*
         Create a MazeBuilder to generate a random set of walls, then remove
         them from the maze graph. By removing these nodes, you prevent them
         from being traversable, so they serve as impassible walls.
         */
        let mazeBuilder = BoxBuilder(maze: self)
        let mazeWalls = mazeBuilder.mazeWallsForRemoval()
        graph.remove(mazeWalls)
    }

    
    

}
