class Node:

    def __init__(self, value, next=None):
        self.value = value
        self.next = next


class Queue:

    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def enqueue(self, value): #Добавление элемента в конец очереди (О(1))
        node = Node(value)

        if self.head is None:
            self.head = node
            self.tail = self.head
        else:
            self.tail.next = node
            self.tail = node

        self.size += 1


    def dequeue(self): #Извлекает элемент из начала очереди(О(1))
        if self.head is None:
            return None

        buff = self.head.value
        self.head = self.head.next
        self.size -= 1

        if self.head is None:
            self.tail = None

        return buff



    def peek(self): #Возвращает первый элемент без удаления (О(1))
        return self.head.value if self.head else None



    def is_empty(self):
        return self.size == 0



    def get_size(self):
        return self.size



    def __str__(self):
        elements = []
        current = self.head
        while current:
            elements.append(str(current.value))
            current = current.next
        return ' -> '.join(elements) if elements else 'Очередь пуста'


queue = Queue()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
print(queue.get_size())
print(queue.peek())
print(queue)

print(queue.dequeue())
print(queue)
print(queue.dequeue())
print(queue)

