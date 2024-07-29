import getpass

def main():
    username = getpass.getuser()
    print(f"Hello {username}!")

if __name__ == "__main__":
    main()
