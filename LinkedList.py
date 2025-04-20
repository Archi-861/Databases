class Node:

    def __init__(self, value):
        self.value = value
        self.next = None


class LinkedList:

    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0



    def append_front(self, value):
        node = Node(value)
        node.next = self.head
        self.head = node

        if self.tail is None:
            self.tail = node

        self.size += 1



    def append_back(self, value):
        new_tail = Node(value)

        if self.head is None:
            self.head = self.tail = new_tail

        else:
            self.tail.next = new_tail
            self.tail = new_tail

        self.size += 1


    def insert(self, index, value):

        node = Node(value)
        current_node = self.head
        count = 0

        while current_node and count < index - 1:
            current_node = current_node.next
            count += 1

        if not current_node:
            self.append_back(value)
        else:
            node.next = current_node.next
            current_node.next = node
            if current_node == self.tail:
                self.tail = node

        self.size += 1



    def remove_front(self):
        if self.head is None:
            print('Список пуст')
            return None

        new_head_value = self.head.value
        self.head = self.head.next

        if self.head is None:
            self.tail = None

        self.size -= 1
        return new_head_value

    def remove_back(self):
        if self.head is None:
            print('Список пуст')
            return None

        new_tail_value = self.tail.value

        if self.head == self.tail:
            self.head = self.tail = None
            return new_tail_value

        current_node = self.head
        while current_node.next != self.tail:
            current_node = current_node.next

        self.tail = current_node
        self.tail.next = None

        self.size -= 1

        return new_tail_value

    def get(self, index):

        if index < 0:
            print('Индекс не может быть отрицательным')
            return None

        current_node = self.head
        count = 0

        while current_node is not None:
            if count == index:
                return current_node.value

            current_node = current_node.next
            count += 1

        print('Индекс выходит за границы списка')
        return None



    def set(self, index, value):

        if index < 0:
            print('Индекс не может быть отрицательным')
            return None

        current_node = self.head
        count = 0

        while current_node is not None:
            if count == index:
                current_node.value = value
                return True

            current_node = current_node.next
            count += 1

        print('Индекс выходит за границы списка')
        return None


    def get_size(self):
        return self.size



    def __str__(self):
        current = self.head
        result = []
        while current is not None:
            result.append(str(current.value))
            current = current.next
        return ' -> '.join(result) + ' -> None'

lst = LinkedList()
lst.append_front(10)
lst.append_front(11)
lst.append_front(12)
print(lst.get_size())
print(lst)

lst.append_back(100)
lst.append_back(200)
print(lst)
print(lst.get_size())
lst.insert(2, 500)
lst.insert(6, 600)
print(lst)

lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# lst.remove_front()
# print(lst)
lst.remove_back()
lst.remove_back()
print(lst)

print(lst.get(2))
print(lst.get(6))

print(lst.get_size())

