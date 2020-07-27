import unittest


class Animal:
    def __init__(self, type, name):
        self.type = type
        self.name = name


class AnimalTracker:
    def __init__(self, animal, index):
        self.animal = animal
        self.index = index


class Stack:
    def __init__(self):
        self.stack = []
        self.index = -1

    def push(self, value):
        self.index += 1
        self.stack.insert(self.index, value)

    def pop(self):
        if self.index < 0:
            return None
        result = self.stack[self.index]
        self.index -= 1
        return result

    def peek(self):
        return self.stack[self.index] if self.index >= 0 else None

    def print(self):
        print(self.stack)


class MyQueue:
    def __init__(self):
        self.s1 = Stack()
        self.s2 = Stack()

    def enqueue(self, value):
        self.swap_s2_to_s1()
        self.s1.push(value)

    def dequeue(self):
        self.swap_s1_to_s2()
        return self.s2.pop()

    def peek(self):
        self.swap_s1_to_s2()
        return self.s2.peek()

    def swap_s1_to_s2(self):
        while self.s1.peek() is not None:
            self.s2.push(self.s1.pop())

    def swap_s2_to_s1(self):
        while self.s2.peek() is not None:
            self.s1.push(self.s2.pop())


class AnimalShelter:
    def __init__(self):
        self.dog_queue = MyQueue()
        self.cat_queue = MyQueue()
        self.master_index = -1

    def enqueue(self, animal):
        self.master_index += 1
        animal_tracker = AnimalTracker(animal, self.master_index)
        if animal.type == "dog":
            self.dog_queue.enqueue(animal_tracker)
        elif animal.type == "cat":
            self.cat_queue.enqueue(animal_tracker)

    def dequeue_dog(self):
        return self.dog_queue.dequeue().animal

    def dequeue_cat(self):
        return self.cat_queue.dequeue().animal

    def dequeue_any(self):
        oldestDogIndex = self.dog_queue.peek(
        ).index if self.dog_queue.peek() is not None else 9999
        oldestCatIndex = self.cat_queue.peek(
        ).index if self.cat_queue.peek() is not None else 9999
        if oldestDogIndex < oldestCatIndex:
            return self.dequeue_dog()
        else:
            return self.dequeue_cat()


def animal_shelter():
    pass


class TestAnimalShelter(unittest.TestCase):

    def test_animal_shelter(self):
        shelter = AnimalShelter()
        dog1 = Animal("dog", "Cooper")
        dog2 = Animal("dog", "Baxter")
        dog3 = Animal("dog", "Rupert")
        cat1 = Animal("cat", "Mittens")
        cat2 = Animal("cat", "Sparkles")
        cat3 = Animal("cat", "Tammy")
        shelter.enqueue(dog1)
        shelter.enqueue(dog2)
        shelter.enqueue(cat1)
        shelter.enqueue(dog3)
        shelter.enqueue(cat2)
        shelter.enqueue(cat3)
        result = shelter.dequeue_cat()
        self.assertEqual(result, cat1)
        result = shelter.dequeue_dog()
        self.assertEqual(result, dog1)
        result = shelter.dequeue_any()
        self.assertEqual(result, dog2)
        result = shelter.dequeue_any()
        self.assertEqual(result, dog3)
        result = shelter.dequeue_any()
        self.assertEqual(result, cat2)
        result = shelter.dequeue_any()
        self.assertEqual(result, cat3)


if __name__ == "__main__":
    unittest.main(verbosity=2)
