class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

    def __repr__(self):
        values = []
        current = self
        while current:
            values.append(str(current.value))
            current = current.next
        return " -> ".join(values)

def merge_linked_list(first, second):
    if first is None:
        return second
    if second is None:
        return first

    if first.value < second.value:
        first.next = merge_linked_list(first.next, second)
        return first
    else:
        second.next = merge_linked_list(first, second.next)
        return second

def merge_sort_linked_list(head):
    if head is None or head.next is None:
        return head

    # Find the middle of the linked list
    slow = head
    fast = head.next

    while fast is not None and fast.next is not None:
        slow = slow.next
        fast = fast.next.next

    # Split the list into two halves
    middle = slow.next
    slow.next = None

    # Recursively sort both halves
    left_sorted = merge_sort_linked_list(head)
    right_sorted = merge_sort_linked_list(middle)

    # Merge the sorted halves
    return merge_linked_list(left_sorted, right_sorted)

# Helper function to create a linked list from a list
def create_linked_list(values):
    if not values:
        return None

    head = Node(values[0])
    current = head
    for value in values[1:]:
        current.next = Node(value)
        current = current.next

    return head

# Test the merge sort function
if __name__ == "__main__":
    head = create_linked_list([4, 2, 1, 3, 5])
    print("Original list:", head)

    sorted_head = merge_sort_linked_list(head)
    print("\nSorted list:  ", sorted_head)

