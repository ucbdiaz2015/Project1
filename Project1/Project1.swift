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

        return nil
    }

    func set(k: K, v: V) {
        // IMPLEMENT ME
    }
}
