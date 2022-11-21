# Dundo

This plugin makes a diff split clone of the current file which you can use to
patch parts of the undo history.

Open a dundo buffer for the current file and start undoing with `U` to see the
history of the file as a diff for the current file.

![Dundo example](https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/749b420d-2b57-4e24-848d-aff89b6b4eb7/dfih1n5-7a6e0d63-9a7f-43ca-b02d-36b2f5f8d605.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzc0OWI0MjBkLTJiNTctNGUyNC04NDhkLWFmZjg5YjZiNGViN1wvZGZpaDFuNS03YTZlMGQ2My05YTdmLTQzY2EtYjAyZC0zNmIyZjVmOGQ2MDUuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.4RCgAJQJGH1WusBTHtqscvwM4WLhv99Hvkvyb2tnjnQ)

## Instructions

- `<leader>dv` - makes a vertical split with the dundo buffer on the left
- Press `U` to start undoing, notice your original file doesn't change, Vim just highlights all the differences
- Press `]c` to jump forward through the diff chunks, `[c` to jump backwards
- Press `>` to put the difference under the cursor back into your file
- When you're done, leave the dundo buffer it'll close automatically
