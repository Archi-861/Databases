class Node:

    def __init__(self, value, prev=None):
        self.value = value
        self.prev = prev


class Stack:

    def __init__(self):
        self.top = None
        self.size = 0



    def push(self, value): #Добавление элемента на веришну стека (О(1))

        node = Node(value, prev=None)

        if self.top is not None:
            node.prev = self.top

        self.top = node

        self.size += 1



    def pop(self): #Удаление верхнего элемента (вершины) ((О(1))

        if self.top is None:
            data = None

        data = self.top.value
        self.top = self.top.prev

        self.size -= 1

        return data



    def peek(self): #Возвращает верхний элемент без удаления (О(1))

        if self.top is None:
            data = None
        else:
            data = self.top.value

        return data



    def is_empty(self): #Проверяет пуст ли стек (О(1))
        return self.size == 0



    def get_size(self):
        return self.size



    def __str__(self):
        elements = []
        current_node = self.top
        while current_node:
            elements.append(str(current_node.value))
            current_node = current_node.prev
        return "\n".join(elements) if elements else "Стек пуст"


stack = Stack()

stack.push(1)
stack.push(2)
stack.push(3)
print(stack)
print('Размер стека - ', stack.get_size())

print('------')

print(stack.peek())

print('------')

stack.pop()
print(stack)
print('Размер стека - ', stack.get_size())
print('------')

stack.pop()
print(stack)

print('------')

print(stack.peek())
print('Размер стека - ', stack.get_size())

stack.pop()
print('Размер стека - ', stack.get_size())
