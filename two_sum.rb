"""Given an array of unique integers and a target sum, 
determine whether any two integers in the array sum to that amount."""

def brute_force_two_sum?(arr, target)
    # O(n^2) worst-case time complexity
    # No new variables so O(1) space complexity 
    arr.each_with_index do |ele_1, idx_1|
        arr.each_with_index do |ele_2, idx_2|
            next if idx_1 == idx_2
            return true if ele_1 + ele_2 == target
        end
    end
    false
end

def sorting_two_sum?(arr, target)
    # #O(nlogn) linearithmic time complexity
    # #O(n) space complexity (updating memory for each index)
    sorted_arr = arr.sort
    sorted_arr.select! {|ele| ele < (target - sorted_arr[0]) }
    i, j = 0, sorted_arr.length-1
    while i < j
        case (sorted_arr[i] + sorted_arr[j]) <=> target
        when 0
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end
    false
end

def hash_two_sum?(arr, target)
    # O(n) time complexity (single loop to create and check hash)
    # O(n) space complexity (storing each ele in hash)
    sum_hash = Hash.new
    arr.each do |ele|
        return true if sum_hash[target-ele]
        sum_hash[ele] = true
    end
    false
end
