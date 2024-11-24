local statusline = {
	"  %t ",
	"[%n]",
	" %m ",
	" %r",
	"%=",
    "  %{&fileencoding}  ",
    "  %{&ff}  ",
	"  %{&filetype}  ",
    " [%l:%c]  ",
	" [%P]  ",
}

vim.o.statusline = table.concat(statusline, "")
