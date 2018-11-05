## Basics
* ^ to move to start of line
* $ to move to end of line
* :q to close a file
* :q! or :x to save (write to) and close a file
* h, j, k, l for left, up, down, right
* gg, G for top, bottom of file
* dw to delete word
* u to undo
* ctrl+u to redo
* ctrl+Y and ctrl+E to scroll up and down

## Navigating windows
* ctrl+h, ctrl+j, ctrl+k, ctrl+l for left, up, down, right window
* In NerdTREE, go to the file window (on the left) and press enter on a file to open it. Or press s to open in a horizontal split, or i to open in a vertical split. Press t to open the file in a new tab
* gt and gT to move forward and backward one tab
* tabe {file} to open a file in a new tab (omit the file argument to open a blank tab)

## The Most Useful NERDTree Commands
* :NERDTreeToggle to toggle the NERDTree window
* :NERDTreeTabsToggle to keep the same NERDTree in all tabs
* ? to toggle the help menu
* I to toggle showing hidden files
* o or <Enter> on a file to open it in the current window
* i or s to open a file in a vertical or horizontal split
* t to open a file in a new tab
* m to open a menu of options for file management (creating, deleting, moving, copying, etc...)
* A to toggle the NERDTree window

## Python Shortcuts
* ,g to goto function definition
* za for code folding
* F7 for flake8 (might need to hold fn on Mac)

## Denite
* Use the up and down keys to view the history (and actual results) for previous Denite commands
* Press Esc or i to enter normal or edit mode. In normal mode you can scroll up and down on the options and press enter to open one or t to open in new tab
* Press Esc then q to exit the Denite window
* ,8 to grep for the word currently under the cursor
* ctrl+p for file_rec or ctrl+p+p for file_rec in the project directory (list files, ignoring hidden files and files listed in .gitignore)

## Misc
* ,om to "open markdown" (GitHub-flavored)
* :!{cmd} to show the output from a reguler Terminal command
* When making shortcuts in init.vim, <CR> is the same as <Enter>
* :checkhealth to verify installation
