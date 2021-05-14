function errmsg() {

    if [[ -z "$1" ]]; then
        errmsg 7001 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, num"
    else
        local num=$(printf "%4u" "$1"); num=${num// /0}
    fi
    if [[ -z "$2" ]]; then
        errmsg 7002 $EX_SOFTWARE "${FUNCNAME}: missing argument 2, ex_code"
    else
        local xcode="$2";
    fi
    shift 2
    if [[ -z "$1" ]]; then
        errmsg 7003 $EX_SOFTWARE "${FUNCNAME}: missing argument 3, msg"
    else
        local msg="$*"
    fi

    case $xcode in
        ( $EX_OK      ) local sev="I";;
        ( $EX_WARNING ) local sev="W";;
        ( $EX_ERROR   ) local sev="E";;
        ( $EX_SEVERE  ) local sev="S";;
        ( *           ) local sev="F";;
    esac

    printf "%s%s%s%s%s\n" $PGMID $num $sev ' ' "$msg" >&2

    setexcode $xcode
    if [[ $sev ==  "F" ]]; then olausend; fi

    return $EX_OK
} # end errmsg

cat >/dev/null <<'=cut'

=head1 NAME

errmsg - write an error message to STDERR, set exit code, exit if fatal.

=head1 SYNOPSIS

errmsg num ex_code msg

=head1 DESCRIPTION

=head1 ARGUMENTS

=over 4

=item I<num>

(required) Error message number.

=item I<ex_code>

(required) Exit Code and Severity of message.

=item I<msg>

(required) Error message text. 

=back

=head1 SECURITY

B<errmsg> does not require root access.

=head1 AVAILABILITY

=head1 EXAMPLES

    errmsg 7001 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, num"

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 ENVIRONMENT

=over 4

=item EX_CODE

Current exit code.

=item PGMID

6 character Program ID, see B<olausbegin>.

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

Re

$Revision: 162 $

$Id: errmsg.sh 162 2007-03-13 00:19:18Z a0214394 $

2006-09-17 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

=head1 BUGS

=head1 SEE ALSO

B<olausbegin>, B<setexcode>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2006 Texas Instruments. All rights reserved.

include(licsense.txt)

=cut

