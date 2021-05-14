
cat >/dev/null <<'=cut'

=head1 NAME

special_list.sh - Function routines for three special linear lists

=head1 SYNOPSIS

source list_special.sh
.      list_special.sh

=head1 DESCRIPTION

Olaus Library implementation of the three special linear lists:

=over 4

=item Stack

=item Queue

=item Deque

=back

    X[1], X[2], ... X[M]
    T points to the tail of the list.
    H points to an empty cell before the head of the list
    There must be at least one empty element in X.

=head2 X <== Y: Insert into Tail of List

    if T = M then T <-- 1 else T <-- T + 1
    if T = H then OVERFLOW
    X[T] <-- Y

=head2 Y <== X: Delete from Head of List

    if H = T then UNDERFLOW
    Y <-- X[H]
    if H = M then H <-- 1 else H <-- H + 1

=head2 X <== Y: Insert onto Head of List

    X[H] <-- Y
    if H = 1 then H <-- M else H <-- H - 1
    if H = T then OVERFLOW

=head2 Y <== X: Delete from Tail of List

    if T = H then UNDERFLOW
    Y <-- X[T]
    if T = 1 then T <-- M else T <-- T - 1

=head1 SUBROUTINES/FUNCTIONS/METHODS

=head2 Stack

Linear list with all insertions, deleations, and accesses
are all made at one end of the list

=head3 Valid Queue Operations

=over 4

=item list_new_stack

=item list_push

=item list_pop

=itme list_head

=item list_push_head

=item list_pop_head

=item list_size

=item list_empty

=item list_type

=back


=head3 list_new_stack STACK

=head3 list_new_queue QUEUE

=head3 list_new_deque DEQUE

=head3 stack_push STACK item

=head3 stack_top STACK

=head3 stack_pop STACK

=head3 stack_empty STACK

=head3 list_size STACK

=head3 list_push_head

=head3 list_push_tail

=head3 list_pop_head

=head3 list_pop_tail

=head3 list_type

=head2 Queue

Linear list with all insertions are made at one end of the list and
deleations and accesses are made at the other end of the list.

=head3 Valid Queue Operations

=over 4

=item list_new_queue

=item list_push

=item list_pop

=item list_head

=item list_push_tail

=item list_pop_head

=item list_size

=item list_empty

=item list_type

=back


=head2 Deque

Linear list with all inserstions, deleations, and accesses
are made at both ends of the list.

=head3 Valid Queue Operations

=over 4

=item list_new_deque

=item list_push

=item list_pop

=item list_head

=item list_tail

=item list_push_head

=item list_push_tail

=item list_pop_head

=item list_pop_tail

=item list_size

=item list_empty

=item list_type

=back

=head1 ARGUMENTS

=over 4

=back

=head1 SECURITY

You do not need to be superuser or login as root to run these functions.

=head1 AVAILABILITY

list_special is distributed with the Olaus Bash Library, contact the author.

=head1 EXAMPLES

=head1 NOTES & CAVEATS

=head1 DIAGNOSTICS

=head1 ENVIRONMENT

=head1 FILES

=head1 STANDARDS

=head1 VERSION

$Date: 2007-05-09 12:38:51 -0500 (Wed, 09 May 2007) $

$Rev: 203 $

$URL: file:///cygdrive/c/svn/olaus/brch/r3.0dev/src/bash/lib/list_doc.sh $

$Id: list_doc.sh 203 2007-05-09 17:38:51Z a0214394 $

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-23 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

Donald E. Knuth, I<The Art of Computer Programming, Volume 1 /
Fundamental Algorithms>, Second Edition,
Addison-Wesley, Reading, 1978

=head1 BUGS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2007 Texas Instruments. All rights reserved.

include(license.txt)

=cut
