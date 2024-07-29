import os
import sys
import shutil
import subprocess

def is_book_file(filename):
    book_extensions = ['.pdf', '.mobi', '.epub', '.azw', '.azw3', '.cbr', '.cbz']
    return any(filename.lower().endswith(ext) for ext in book_extensions)

def check_readability(file_path):
    try:
        subprocess.run(['SumatraPDF.exe', file_path], check=True)
        return True
    except subprocess.CalledProcessError:
        return False

def delete_unplayable_files(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if is_book_file(filename):
            print(f"Checking {filename}...")
            if not check_playability(file_path):
                print(f"Deleting unplayable file: {file_path}")
                os.remove(file_path)

def check_book_files_and_move(directory, destination):
    # List of book file extensions to check
    book_extensions = ['.pdf', '.mobi', '.epub', '.azw', '.azw3', '.cbr', '.cbz']
    
    # Check if the directory exists
    if not os.path.exists(directory):
        print(f"Error: Directory '{directory}' does not exist.")
        return
    
    # Flag to track if any book files were found
    book_found = False
    
    # Iterate through files in the directory
    for root, dirs, files in os.walk(directory):
        for file in files:
            # Check if the file has a book extension
            if is_book_file(file):
                book_found = True
                file_path = os.path.join(root, file)
                print(f"book file found: {file_path}")

                # print(f"Checking {file}...")
                # if not check_playability(file_path):
                #     print(f"Deleting unplayable file: {file_path}")
                #     os.remove(file_path)
                # else:

                # Move the book file to the destination directory
                try:
                    shutil.move(file_path, destination)
                    print(f"Moved '{file}' to '{destination}'")
                except Exception as e:
                    print(f"Error moving '{file}' to '{destination}': {e}")

    if not book_found:
        print("No book files found in the directory.")

if __name__ == "__main__":
    # If no argument is provided, use the current working directory
    if len(sys.argv) == 1:
        directory = os.getcwd()
    else:
        directory = sys.argv[1]
    
    destination = r'E:\Projects\webscraping\books'  # Destination directory
    
    check_book_files_and_move(directory, destination)
