func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    // IMPLEMENT ME
    // Take a look at https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life for the rules
    return currentStates
}

class LRUCache<K:Hashable, V> {
    private var capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(k: K) -> V? {
        // IMPLEMENT ME

        /*
        *  Get the value of the key if the key exists in the cache, otherwise return nil.
        */

        return nil
    }

    func set(k: K, v: V) {
        // IMPLEMENT ME

        /*
        * Set or insert the value if the key is not already present. 
        * When the cache reached its capacity, it should invalidate the 
        * least recently used item before inserting a new item.
        */
    }
}
