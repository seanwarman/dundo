# Dundo

This plugin makes a diff split clone of the current file which you can use to
patch parts of the undo history.

Open a dundo buffer for the current file and start undoing with `U` to see the
history of the file as a diff for the current file.

![Dundo example](./coolest.gif)

## Instructions

- `<leader>dv` - makes a vertical split with the dundo buffer on the left
- Press `U` to start undoing, notice your original file doesn't change, Vim just highlights all the differences
- Press `]c` to jump forward through the diff chunks, `[c` to jump backwards
- Press `>` to put the difference under the cursor back into your file
- When you're done, leave the dundo buffer it'll close automatically
