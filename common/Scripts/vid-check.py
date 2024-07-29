import os
import sys
import shutil
import subprocess

def is_video_file(filename):
    video_extensions = ['.mp4', '.avi', '.mkv', '.mov', '.flv', '.wmv', '.webm']
    return any(filename.lower().endswith(ext) for ext in video_extensions)

def check_playability(file_path):
    try:
        subprocess.check_output(['ffprobe', '-v', 'error', '-select_streams', 'v:0', '-show_entries', 'stream=codec_type', '-of', 'default=noprint_wrappers=1:nokey=1', file_path], stderr=subprocess.STDOUT)
        return True
    except subprocess.CalledProcessError:
        return False

def delete_unplayable_files(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if is_video_file(filename):
            print(f"Checking {filename}...")
            if not check_playability(file_path):
                print(f"Deleting unplayable file: {file_path}")
                os.remove(file_path)



def check_video_files(directory):
    # List of video file extensions to check
    video_extensions = ['.mp4', '.avi', '.mkv', '.mov', '.wmv', '.flv', '.webm']
    
    # Check if the directory exists
    if not os.path.exists(directory):
        print(f"Error: Directory '{directory}' does not exist.")
        return
    
    # Flag to track if any video files were found
    video_found = False
    
    # Iterate through files in the directory
    for root, dirs, files in os.walk(directory):
        for file in files:
            # Check if the file has a video extension
            if is_video_file(file):
                video_found = True
                file_path = os.path.join(root, file)
                # print(f"Video file found: {file_path}")
                print(f"Checking {file}...")
                if not check_playability(file_path):
                    print(f"Deleting unplayable file: {file_path}")
                    os.remove(file_path)

                # else:
                #     # Move the video file to the destination directory
                #     try:
                #         shutil.move(file_path, destination)
                #         print(f"Moved '{file}' to '{destination}'")
                #     except Exception as e:
                #         print(f"Error moving '{file}' to '{destination}': {e}")

    if not video_found:
        print("No video files found in the directory.")


def check_video_files_and_move(directory, destination):
    # List of video file extensions to check
    video_extensions = ['.mp4', '.avi', '.mkv', '.mov', '.wmv', '.flv', '.webm']
    
    # Check if the directory exists
    if not os.path.exists(directory):
        print(f"Error: Directory '{directory}' does not exist.")
        return
    
    # Flag to track if any video files were found
    video_found = False
    
    # Iterate through files in the directory
    for root, dirs, files in os.walk(directory):
        for file in files:
            # Check if the file has a video extension
            if is_video_file(file):
                video_found = True
                file_path = os.path.join(root, file)
                # print(f"Video file found: {file_path}")
                print(f"Checking {file}...")
                if not check_playability(file_path):
                    print(f"Deleting unplayable file: {file_path}")
                    os.remove(file_path)
                else:
                    # Move the video file to the destination directory
                    try:
                        shutil.move(file_path, destination)
                        print(f"Moved '{file}' to '{destination}'")
                    except Exception as e:
                        print(f"Error moving '{file}' to '{destination}': {e}")

    if not video_found:
        print("No video files found in the directory.")


def main():
    # If no argument is provided, use the current working directory
    if len(sys.argv) == 1:
        directory = os.getcwd()
    else:
        directory = sys.argv[1]

    destination = r'C:\Users\mino29\Videos'  # Destination directory
    check_video_files_and_move(directory, destination)

    # check_video_files(directory)


if __name__ == "__main__":
    main()
