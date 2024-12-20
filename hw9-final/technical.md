### Question 1: Describe how would mergesort be implemented on a linkedlist. You may be tempted to traverse the list, copy its values in an array, mergesort the array, and create a new linkedlist with the sorted array's content. Don't! Think how you'll do the merge sort in-place, moving around nodes. The process is shown  in the following illustration.
#### You don't have to code this, but your description of the technique needs to be detailed enough almost down to the pseudocode level.

The main problem with merge sorting a linked list is finding the middle, besides that, since merge sort does not require us to go backward at all, merge sorting a linked list should not be overly difficult. To find the middle of the list we could use the fast and slow pointer. We initialize two cursors to the head of a linked list. We move the slow pointer one node and move the fast pointer two nodes. Once the fast pointer hits the end of the linked list we know the slow pointer is at the middle of the list. Since we've now found the middle of the list we can keep splitting the linked list recursively from the left and right. We could start from the head and stop at the slow pointer for recursing left and then for recursing right, we start at the slow pointer and go until the end of the list, or when cursor.next == null. We also update the pointers to split the list by setting the middle.next node to null and then we recurse.

After we split the linked list down to either size zero or one, we know that a list of size one is sorted so we can start the merging. To attempt to do this in-place, instead of making a new linked list we can update the pointers for certain nodes and then recursively call the merge for the rest of the list. We compare the values for the left and right sections of the list and based on that we change the recursive call. If the left is smaller than the right section, we append the current sorted left side to the result of a recursive call from the next left node and the same right node, essentially moving one node in. This recursive call will eventually end up in a returned sorted list which is how we append it. We do the same for the right side if the right is smaller than the left. But instead of appending to the left node, we update and append to the next node for the right and call the merge on the left value on the next node for the right. 

If this explanation lacks clarity you can reference the pseudo code below. We have two methods, one the splits the list and returns the final sorted list and one to merge the split lists.

``` java
// head is the start of the linked list that needs to be sorted

function mergeLinkedList(first, second)
    // Base case for when one of the lists is null
    if first is null
        return second
    if second is null
        return first

    // If the first nodes value is smaller than the second nodes value
    // we append the rest of the sorted list (which will be recursively sorted)
    // to the first pointer. When we call mergeLinkedList we call it on the next 
    // node for the first pointer, essentially moving to the next node because the
    // current node is now sorted
    if (first.val < second.val)
        first.next = mergeLinkedList(first.next, second)
        return first
    // Do the same thing described above but on the second node because the second
    // node is now smaller in this case.    
    else 
        second.next = mergeLinkedList(first, second.next)
        return second

function mergeSortLinkedList(head)
    // Base case for already sorted linked list
    if (head is null or head.next is null)
        return head

    // cursors to find the middle
    slow = head
    fast = head

    // find middle 
    while (fast is not null and fast.next is not null) 
        fast = fast.next.next
        if (fast is not null)
            slow = slow.next

    // Split the list
    middle = slow.next
    slow.next = null

    // Keep splitting the left and right sections of the linked list
    leftSorted = mergeSortLinkedList(head)
    rightSorted = mergeSortLinkedList(middle)

    // Return the merge linked list, this is a recursive call that calls itself 
    return mergeLinkedList(leftSorted, rightSorted)
```

### Question 2: Imagine you are about to enroll in a graduate course in algorithms. For the first class meeting, your professor asks you to write a brief note about your favorite algorithm. What's your favorite algorithm and why? (100-300 words).

If a professor were to ask me what my favorite algorithm is, it would probably have to say that it is binary search. This is for many reasons. First, it was the first algorithm I learned about and the way that it was explained to me was very appealing. It was explained to me using the phone book example where you're asked what the best way to find a name in a phone book is. It is then explained that you start at the middle and ask whether the name is to the left or right of the position. Then you gave halfway between whichever side they said and where you currently are. You repeat until you find the person's name in the phone book. I like the algorithm because anything that runs in O(logn) I like. I also think it's just a very intuitive solution that applies to a lot of things within computer science. 


### Question 3: in the same scenario above, your professor asks you to write a brief note about your least favorite algorithm. Which one is it and why? (100-300 words)

My least favorite algorithm would probably have to be anything with Dynamic Programming. If you need something specific we could say the knapsack problem. I really like the idea behind dynamic programming, taking something that would take essentially an infinite amount of time to compute but instead make it run in around O(n^2) runtime is quite intriguing to me and I had always heard of the term dynamic programming through random videos and leetcode questions but I had never seen how it actually is implemented. The reason that it is my least favorite algorithm is because Im so intrigued by it but I just can't wrap my head around how it manages to work (yet). I understand that it's somewhat like recursion with memorization and that we have a table with the ranges of values for the specific problem, but I don't know how I could implement the algorithm for any specific problem and it seems like such a useful tool to have. That is why it is my least favorite algorithm. Once I "master" the algorithm I think it will probably be one of my favorites, but we're not there yet.  