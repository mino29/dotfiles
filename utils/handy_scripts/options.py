import os
import sys

PROXY_PORT = 7890
PROXY_URL = f"http://127.0.0.1:{PROXY_PORT}"


def clear_screen():
    # Clear the screen depending on the operating system
    if os.name == 'nt':  # For Windows
        os.system('cls')
    else:  # For Linux and macOS
        os.system('clear')


def read_key():
    """Read a single keypress on both Windows and POSIX.

    msvcrt only exists on Windows, so fall back to termios for Linux/macOS.
    """
    if os.name == 'nt':
        import msvcrt
        return msvcrt.getch()
    import termios
    import tty
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        return sys.stdin.buffer.read(1)
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


def action_option1():
    os.system(f"git config --global http.proxy {PROXY_URL}")
    os.system(f"git config --global https.proxy {PROXY_URL}")
    print("This is option 1. Git proxy turned on.")


def action_option2():
    os.system("git config --global --unset http.proxy")
    os.system("git config --global --unset https.proxy")
    print("This is option 2. Git proxy turned off.")


def main():
    # Define menu options
    options = ['On', 'Off']
    actions = [action_option1, action_option2]
    current_option = 0

    # Loop to display and handle user input
    while True:
        clear_screen()  # Clear the screen

        # Display options
        for i, option in enumerate(options):
            # Highlight the current option
            if i == current_option:
                print(f' > {option} < ')
            else:
                print(f'   {option}   ')

        # Display the prompt to quit the program
        print("\nPress 'q' to quit the program.")

        # Get user input
        key = read_key()

        # Handle user input
        if key in [b'\r', b'\n']:
            # User pressed Enter, confirm selection
            selected_option = options[current_option]
            print(f'Selected: {selected_option}')
            # Perform the action associated with the selection
            actions[current_option]()
            break
        elif key in [b'j', b'K']:
            # User pressed 'j', move to next option
            current_option = (current_option + 1) % len(options)
        elif key in [b'k', b'H']:
            # User pressed 'k', move to previous option
            current_option = (current_option - 1) % len(options)
        elif key == b'q':
            # User pressed 'q', quit the program
            print("Program is quitting...")
            return


# Run the program
if __name__ == '__main__':
    main()