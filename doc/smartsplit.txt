*smartsplit.txt* You're lazy. Let Vim decide your split directions.

Author: Daniel Moch <daniel@danielmoch.com>
License: VIM LICENSE

                                        *smartsplit*

Yeah, you're aware of split/vsplit, new/vnew and the like. You use them
because you have to, but you know there must be a better way. This is it.

Vim, given it's old pedigree, tacitly assumes a standard terminal width of
around 80 characters. In this environment it makes sense for Vim to assume any
command that divides the current window should divide horizonally. But our
monitors are often capable of more than twice the width of an old terminal, so
this doesn't make sense any more.

One sensible option, which this plugin adopts, is to make a best-guess at the
width of the text displayed in the current window (see 'textwidth'. Then
operations should default to vertical if there is enough horizonal room to
display two splits side-by-side.

This plugin provides :Help, :Split, :New, and :Buffer commands to replace
their lower-case counterparts. It also sets 'diffopt' to split in either a
horizontal or vertical direction, again depending on the horizontal space
available.

1. Commands                              |smartsplit-commands|
2. About                                 |smartsplit-about|

=============================================================================
1. Commands                             *smartsplit-commands*

                                        *smartsplit-Split* *:Split*
Split                       A smart version of the |:split| command. Open a new
                            split in the current tab. The direction is
                            determined in reference to the value of
                            'textwidth' for the current buffer (defaulting to
                            80). If the horizontal space is greater than twice
                            the current 'textwidth' value, then the split is
                            made vertically. Otherwise the split is
                            horizontal.

                                        *smartsplit-New* *:New*
New                         A smart version of |:new|. Horizontal versus
                            vertical splitting is determined as described in
                            |:Split|.

                                        *smartsplit-Buffer* *:Buffer*
Buffer                      A smart version of |:buffer|. Horizontal versus
                            vertical splitting is determined as described in
                            |:Split|.

                                        *smartsplit-Help* *:Help*
Help                        A smart version of |:help|. Horizontal versus
                            vertical splitting is determined as described in
                            |:Split|.

                                        *smartsplit-CmdSplit* *:CmdSplit*
CmdSplit {cmd}              A smart version of |:vertical|. Horizontal versus
                            vertical splitting is determined as described in
                            |:Split|.

                                     *smartsplit-ScratchBuffer* *:ScratchBuffer*
ScratchBuffer               Open a scratch buffer (see |special-buffers|).
                            Horizontal versus vertical splitting is determined
                            as described in |:Split|.

=============================================================================
2. ABOUT                                *smartsplit-about*

More details can be found in README.md or by navigating to:

    https://git.danielmoch.com/vim-smartsplit/about

vim:tw=78:ts=8:ft=help:norl:
