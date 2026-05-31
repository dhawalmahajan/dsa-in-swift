//
//  CovidSpread.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 31/05/26.
//

/*
Aterp is the head nurse at a city hospital.City hospital contains R *C number
of wards and the structure of a hospital is in the form of a 2 -
D matrix.Given a matrix of dimension R *C where each cell in the matrix can
have values 0,
1, or 2 which has the following meaning : 0 : Empty ward 1
: Cells have uninfected patients 2
: Cells have infected patients

An infected patient at ward[i, j] can infect other uninfected patient
at indexes[i - 1, j],
[ i + 1, j ], [ i, j - 1 ],
[ i, j + 1 ](up, down, left and right) in unit time
.Help Aterp determine the minimum units of time after which there won't
remain any uninfected patient i.e all patients would be infected. If all
patients are not infected after infinite units of time then simply return -1.
*/
private func helpAterp(hospital:inout [[Int]]) -> Int {
    let rowCount = hospital.count
    let columnCount = hospital.first?.count ?? 0
    var queue: [(row:Int,col:Int)] = []
    var hasInfected: Bool = false
    var hasUninfected: Bool = false
    var timer = 0
    let rowOffset: [Int] = [-1,1,0,0]
    let colOffset: [Int] = [0,0,-1,1]
    for i in 0..<rowCount {
        for j in 0..<columnCount {
            if hospital[i][j] == 2 {
                queue.append((i,j))
                hasInfected = true
            }
            if hospital[i][j] == 1 {
                hasUninfected = true
            }
        }
    }
    if !hasUninfected {
        return 0
    }
    if !hasInfected {
        return -1
    }
    
    while !queue.isEmpty {
        timer += 1
        let currentPatient = queue.count
        for _ in 0..<currentPatient {
            let q = queue.removeFirst()
            let i = q.row
            let j = q.col
            
            for k in 0..<4 {
                if valid(i: i+rowOffset[k], j: j+colOffset[k], rowCount: rowCount, columnCount: columnCount)
                    && hospital[i + rowOffset[k]][j+colOffset[k]] == 1 {
                    hospital[i+rowOffset[k]][j+colOffset[k]] = 2
                    queue.append((i+rowOffset[k], j+colOffset[k]))
                }
            }
        }
    }
    for i in 0..<rowCount {
        for j in 0..<columnCount {
            if hospital[i][j] == 1 {
                return -1
            }
        }
    }
    return timer - 1
}

private func valid(i: Int, j: Int, rowCount: Int, columnCount: Int) -> Bool {
    return i >= 0 && i < rowCount && j >= 0 && j < columnCount
}

func covidSpreadDemo() {
    var hospital1 = [
        [2, 1, 0, 2, 1],
        [1, 0, 1, 2, 1],
        [1, 0, 0, 2, 1]
    ]
    var hospital2 = [
        [2, 1, 0, 1, 1],
        [1, 0, 1, 0, 1],
        [1, 0, 0, 0, 1]
    ]
    var hospital3 = [
        [0, 0, 0],
        [0, 2, 0],
        [0, 0, 0]
    ]
    print("--- Test Case 1 ---")
    let time1 = helpAterp(hospital: &hospital1)
    print("Minimum time needed: \(time1)") // Expected Output: 2
}
