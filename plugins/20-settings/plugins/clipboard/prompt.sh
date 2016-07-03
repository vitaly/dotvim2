desc <<END
With this "on", every time you yank in vim it will be immediately available in
the system clipboard, as if you did '"+y'.

I admit, it sounds like a terrific idea, I was all to tired to '"+yy' and
stuff. But since I turned this on, I was having a different kind of problem.

Before the switch I'd copy something from a web page, and then do e.g.
'cib<Apple>V' to replace content of a block with whatever I copied.  Now it no
longer works. As soon as you 'cib' the content of the block replaces your
clipboard content, so you end up pasting it all back, duh! :)

And to add insult to the injury, whatever you copied is not on the yank ring history.

So... I'm still trying to make use of this as I'm all to tired of '"+y', but I
decided to make this configurable, as not everyone might want to invest the time
to rewire muscle memory ;)
END

ask bool system_clipboard '"merge" vim and system clipboards?'
