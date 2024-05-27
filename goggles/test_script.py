import Quartz
from pynput import keyboard
from AppKit import NSApplication, NSApp, NSWorkspace

def resize_window():
    options = Quartz.kCGWindowListOptionOnScreenOnly | Quartz.kCGWindowListExcludeDesktopElements
    window_list = Quartz.CGWindowListCopyWindowInfo(options, Quartz.kCGNullWindowID)
    frontmost_app_pid = NSWorkspace.sharedWorkspace().frontmostApplication().processIdentifier()
    frontmost_window = next((window for window in window_list if window['kCGWindowOwnerPID'] == frontmost_app_pid), None)
    
    if frontmost_window:
        window_id = frontmost_window['kCGWindowNumber']
        print(window_id)
        new_width, new_height = 800, 600  # New dimensions
        Quartz.CGWindowMoveResize(window_id, 200, 200, new_width, new_height)
        print("resize complete?")

def on_press(key):
    try:
        if key.char == 'r':  # Assuming you want to resize when 'R' is pressed
            print("pressed")
            resize_window()
    except AttributeError as error:
        print("error is ", error)

def main():
    with keyboard.Listener(on_press=on_press) as listener:
        print("running")
        listener.join()

if __name__ == '__main__':
    main()
