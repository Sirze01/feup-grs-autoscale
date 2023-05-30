import time
from locust import HttpUser, task, between

class QuickTestUser(HttpUser):
    wait_time = between(1, 3)

    @task
    def hello_world(self):
        self.client.get("/")