func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    // IMPLEMENT ME
    // Take a look at https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life for the rules
    
    
    var newStates = Array(count: currentStates.count, repeatedValue: Array(count: currentStates[0].count, repeatedValue: Bool()))
    //[[Bool]]()
    
    var i = 0
    for cell in currentStates {
        var j = 0
        for cell2 in cell {
            var neighbors = 0
            //check left, right, up, and down
            if (j+1<cell.count && currentStates[i][j+1]) {
                neighbors += 1;
            }
            if (j-1>=0 && currentStates[i][j-1]) {
                neighbors += 1;
            }
            if (i+1<currentStates.count && currentStates[i+1][j]) {
                neighbors += 1;
            }
            if (i-1>=0 && currentStates[i-1][j]) {
                neighbors += 1;
            }
            
            //check diagonal neighbors
            if (j+1<cell.count && i+1<currentStates.count && currentStates[i+1][j+1]) {
                neighbors += 1;
            }
            if (j-1>=0 && i+1<currentStates.count && currentStates[i+1][j-1]) {
                neighbors += 1;
            }
            if (j+1<cell.count && i-1>=0 && currentStates[i-1][j+1]) {
                neighbors += 1;
            }
            if (j-1>=0 && i-1>=0 && currentStates[i-1][j-1]) {
                neighbors += 1;
            }
            
            
            
            if (cell2) {
                if (neighbors < 2 || neighbors > 3) {
                    newStates[i][j] = false
                } else {
                    newStates[i][j] = true
                }
            } else {
                if (neighbors == 3) {
                    newStates[i][j] = true
                } else {
                    newStates[i][j] = false
                }
            }
            j += 1
        }
        i += 1
    }
    
    return newStates
}


class LRUCache<K:Hashable, V> {
    private var capacity: Int
    private var pairs: Dictionary<K, (V,Int)>
    private var time: Int

    init(capacity: Int) {
        self.capacity = capacity
        self.pairs = Dictionary<K,(V,Int)>()
        self.time = 0
    }

    func get(k: K) -> V? {
        // IMPLEMENT ME

        /*
        *  Get the value of the key if the key exists in the cache, otherwise return nil.
        */
        
        //if key exists, move it to front of cache & return its value, 
        //else remvoe LRU & insert k,v to front of cache (maybe not?)
        if let kVal = pairs[k] {
            pairs[k] = (kVal.0,time)
            time++
            return kVal.0
        }
        return nil
    }

    func set(k: K, v: V) {
        // IMPLEMENT ME

        /*
        * Set or insert the value if the key is not already present. 
        * When the cache reached its capacity, it should invalidate the 
        * least recently used item before inserting a new item.
        */
        if get(k) == nil && capacity > 0 { //only if k not present
            
        
            var minTime: Int = time
            var minKey: K?
            if pairs.count == capacity {
                for pair in pairs {
                    if pair.1.1 < minTime {
                        minTime = pair.1.1
                        minKey = pair.0
                    }
                }
                if let min = minKey {
                    pairs[min] = nil
                }
            
            }
            pairs[k] = (v, time)
            time++
        } else if capacity < 1 {
            pairs[k] = nil
        }
    }
}
