import requests

response = requests.get("https://gitlab.com/api/v4/users/nanuchi/projects")
# print(response)
# print(response.json()[0])

print(f"\n\nProjects")

my_projects = response.json()
for item in my_projects:
    print(f"Project name: {item['name']}\t\t\t\t Url: {item['web_url']}")
    # print(item["name"], item["web_url"])