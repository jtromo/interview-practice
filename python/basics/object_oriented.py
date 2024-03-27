def main():
    class User:
        def __init__(self, email, name, password, current_job_title):
            self.email = email
            self.name = name
            self.password = password
            self.current_job_title = current_job_title

        def update_password(self, new):
            self.password = new

        def update_title(self, new):
            self.current_job_title = new

        def get_user_info(self):
            print(f"{self.name} is employed as a {self.current_job_title}. Contact at: {self.email}")

        def get_user_info_debug(self):
            print("User info:", self.email, self.name, self.current_job_title)

    user1 = User("test@gmail.com", "James", "pass", "boss")
    user1.get_user_info()
    user1.update_password("new pass")
    user1.update_title("new guy")
    user1.get_user_info()

    user1.name = "Guy"
    user1.get_user_info()

if __name__ == '__main__':
    main()
