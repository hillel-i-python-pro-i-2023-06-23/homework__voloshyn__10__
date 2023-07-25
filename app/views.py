from django.http import HttpResponse
from faker import Faker

fake = Faker()


def generate_user_data(num_users=100):
    users = []
    for _ in range(num_users):
        name = fake.first_name()
        email = fake.email()
        user_data = f"{name} {email}"
        users.append(user_data)
    return users


def index(request):
    return HttpResponse(f"{generate_user_data()}")
