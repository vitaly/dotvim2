enum deoplete "use Deoplete"
enum youcompleteme "use YouCompleteMe"

desc <<END
What completion plugin to use?

> Note: if YouCompleteMe installation fails, try to running it manually with "make completion"
END

ask enum completion_engine "completion engine?" 1

load "$(this_dir)/engine/$completion_engine"
