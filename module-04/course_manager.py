import random  # for random

# Define a Course object


class Course:
    """An object representing a particular section of a university course"""
    def __init__(self, name: str, course_number: str, section: str, term: str,
                 student_count: int) -> None:
        self.name = name
        self.course_number = course_number
        self.section = section
        self.term = term
        self.student_count = student_count

    @property
    def student_count(self):
        return self.__student_count

    @student_count.setter
    def student_count(self, count: int):
        if not isinstance(count, int):
            raise TypeError("Count must be integer")
        if count < 0:
            return ValueError("Count may not be negative")
        self.__student_count = count


def create_course_from_input() -> Course:
    """Requests the corresponding data from input, and creates a course object.
    """
    name = input("Enter course name\t(ex. Programming II)\t: ")
    number = input("Enter course number\t(ex. CS 1322)\t\t: ")
    section = input("Enter section no.\t(ex. W03)\t\t: ")
    term = input("Enter term\t\t(ex. Fall 2020)\t\t: ")
    students = 0
    return Course(name, number, section, term, students)


def create_course_list_from_input() -> list[Course]:
    """Generate a list of Course objects from user input."""
    courses: list[Course] = []
    while True:
        try:
            # Create a course object from input
            c = create_course_from_input()
            # Invoke a method to change the value of one of its attributes
            c.student_count = int(random.random() * 100)
            # Store the object in the array
            courses.append(c)
            if input("Continue adding? [Yn]") == "n":
                break
        except EOFError:
            print('\n\n')
            break
    return courses


def print_course_table(courses: list[Course]):
    """Given a list of Course objects, prints them in a nicely formatted table
    which displays the value of each attribute of every course in the array.
    """
    def row(num, name, sec, term, stu):
        return f"{num:10} {name:30} {sec:3} {term:9} {stu:3}"
    print(row("Number", "Course name", "Section", "Term", "Students"))
    print("=" * 70)
    for c in courses:
        print(row(c.course_number, c.name, c.section, c.term, c.student_count))


# Main program
course_list = create_course_list_from_input()
print_course_table(course_list)