# KeyboardAndMouseStats.ahk

Monitoring and logging of: 
- pressed keyboard keys,
- pressed mouse buttons, 
- travelled real distance of mouse body moved over a surface.

Additionally heat map displayed in a form of GUI (Graphical User Interface).

This script works only in Microsoft Windows. Written in [AutoHotkey][] language.

Statistics is saved in a log file every hour since the application starts. It is possible to copy statistics on demand to a Clipboard.

## How to run it

You need to install at first the [AutoHotkey][] language interpreter (open source, GNU GPL license). Next copy the files: **KeyboardAndMouseStats.ahk** and **Lib** folder to any place in your hard disk. Click / press enter on **KeyboardAndMouseStats.ahk**.

## Screen shots

The default GUI, when some keyboard keys are already pressed:
![GUI 1](/pictures/GUI01.png) 

After pressing Ctrl key you get statistics about specific keys:
![GUI 1](/pictures/GUI02.png)

## How to display a GUI 

Click in system tray, next in icon of **KeyboardAndMouseStats**, left mouse click. The GUI will be displayed in the center of your default monitor. If in doubt, hover mouse cursor over the system tray icons. The one belonging to **KeyboardAndMouseStats** will show its name in tooltip.

Left mouse click brings tiny menu:
![GUI 1](/pictures/Tray01.png)

## Hotkeys

Hotkeys are active only when GUI window is active.

| hotkey | meaning | comment |
| :---         |     :---      |          ---: |
| Control      | to display individual values for pressed keys     | left or right, press and hold    |
| mouse click  | to update values within GUI | left or middle or right, press and hold |
| F1 or ?      | to display this info       |         |
| F2           | to copy current statistics to Clipboard | | 	
| F3			| to copy heatmap scale to Clipboard | |
| F4			| to save current statistics now to log | |
	
## Additional info

To toggle between names of keys / buttons and values of respective counters just press and hold Control keyboard key (press to display values, release to switch back to names of keys). The same works for any mouse key.

The values in the first column to the right are total sum of counted values: top - keyboard, bottom - mouse.

For mouse cursor there are displayed values of real distance travelled by mouse body over a surface, estimated in meters [m]. It is possible if mouse resolution, aka DPI (Dots Per Inch) is known. The default value, 1600, is hardcoded in a script. If you wish to change it, search in **KeyboardAndMouseStats.ahk** for **vDPI**. If you wish to determine DPI for your mouse, follow the directions found in [this video][].

The distance is calculated only between consecutive mouse clicks, what reduces overall accuracy. Please note that for better accuracy the setting *Enhance pointer precision* of a mouse should be disabled. 

[AutoHotkey]: https://www.autohotkey.com/
[this video]: https://youtu.be/pTMJX-hVMsQ?si=I-aWrj2YzUQjicoe