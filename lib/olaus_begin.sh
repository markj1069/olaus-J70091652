# ols_begin - Olaus BASH Shell Housekeeping Function at Beginning of Script

cat >/dev/null <<'/*'

=head1 NAME

ols_begin - Olaus BASH Shell Housekeeping Function at Beginning of Script

=head1 SYNOPSIS

. $OLSLIB/olaus_begin.sh

ols_begin 

=head1 DESCRIPTION

=head1 SUBROUTINES/FUNCTIONS/METHODS

=head1 SECURITY

B<ols_begin> does not need to run as root.

=head1 AVAILABILITY

=head1 EXAMPLES

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 RETURN STATUS

=over 4

=item EX_OK

=back

=head1 DEPENDENCIES

=head1 INCOMPATABILITIES

=head1 CONFIGURATION AND ENVIRONMENT

=over 4

=item DATE

=item EX_OK

B<errmsg>, 

=item PGMDATE

=item PGMREL

=item YEAR

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-22 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

Robins, Arnold and Nelson H F Beebe. 2005. Classic Shell Scripting. Sebastopol: O'Reilly Media

=head1 BUGS AND LIMITATIONS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2006 Texas Instruments. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

=over 4

=item 1.

Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

=item 2.

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

=back

THIS SOFTWARE IS PROVIDED BY TEXAS INSTRUMENTS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TEXAS INSTRUMENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

The views and conclusions contained in the software and
documentation are those of the authors and should not be interpreted
as representing official policies, either expressed or implied, of
Texas Instruments.

=cut
/*

. $OLSLIB/errmsg.sh
. $OLSLIB/getopt.sh
. $OLSLIB/ols_file.sh
. $OLSLIB/ols_help.sh
. $OLSLIB/ols_list.sh
. $OLSLIB/ols_man.sh
. $OLSLIB/ols_msg.sh
. $OLSLIB/ols_temp.sh
. $OLSLIB/ols_signal.sh
. $OLSLIB/ols_test.sh
. $OLSLIB/ols_type.sh
. $OLSLIB/ols_usage.sh
. $OLSLIB/ols_version.sh
. $OLSLIB/vecho.sh

declare -a SYSIN=('')            # Input  files
declare -a SYSOUT=('')           # Output files

function olaus_begin() {

  # Setup default Exception Handeling
    trap 'ols_signal SIGTERM' SIGTERM  # Process Terminal signal
    trap 'ols_signal SIGHUP'  SIGHUP   # Process Hang Up signal
    trap 'ols_signal SIGINT'  SIGINT   # Cleanup after cntl-C
    trap 'ols_signal EXIT'    EXIT     # Insure a graceful exit
    trap 'ols_signal ERR'     ERR      # Trap failing commands

    $Date: 2006-09-24 19:19:39 -0500 (Sun, 24 Sep 2006) $
    $URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/ols_begin/lib/ols_begin.sh $
    $Author: a0214394 $
    $Id: ols_begin.sh 104 2006-09-25 00:19:39Z a0214394 $
    $Revision: 104 $

    PGMDATE=${PGMDATE#\$Date:\ }
    PGMDATE=${PGMDATE%%\ *}
    PGMDATE=$(echo $PGMDATE | tr '/' '-')
    readonly PGMDATE

    PGMREL=${PGMREL#\$Name:\ }
    PGMREL=${PGMREL%%\ *}
    if [ "$PGMREL" ==  "$" ]; then
        PGMREL='$Revision: 104 $'
        PGMREL=${PGMREL#\$Revision:\ }
        PGMREL=${PGMREL%%\ *}
        PGMREL="Development $PGMREL"
    fi
    readonly PGMREL

  # Make some pretty date strings
    DATE=$(date +'%Y-%m-%d')
    YEAR=$(date +'%Y')
    readonly DATE
    readonly YEAR

    return $EX_OK
} # end olausbegin

# ols_end - Olaus BASH Shell Housekeeping Function at End of Script

cat >/dev/null <<'/*'

=head1 NAME

ols_end - Olaus BASH Shell Housekeeping Function at End of Script

=head1 SYNOPSIS

ols_end

=head1 DESCRIPTION

B<ols_end> removes temporary files created by mktfile.

=head1 EXAMPLE

    TMPDIR=.
    mktfile
    mktfile
    mktfile
    mktfile
    mktfile
    clsfile

results in

    ./tmp.oLQAKu3856
    ./tmp.YYPgYWa576
    ./tmp.bleTsL1664
    ./tmp.cQPswSq872
    ./tmp.JVydYl5792
    ./tmp.IinrNW1440
    /tmp/OLSMKT.SDwX6040

temporary files being removed.

=head1 DIAGNOSTICS

ols_clean: cannot remove $file

=head1 ENVIRONMENT

=over 4

=item OLSMKT

A temporary file to remember temporary file names.

=back

=head1 FILES

OLKMKT

clsfile removes temporary files.

=head1 VERSION

$Revision$

$Id: clsfile.sh 87 2006-09-13 17:06:10Z a0214394 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/clsfile/clsfile.sh $

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-12 - Function created by nuf ver. 3.0.0

=cut

/*
function ols_end() {

    trap '' EXIT                 # No need to trap exit here
  # Remove any temporary files.
    if [[ -n "$OLSMKT" ]]; then
        while read file; do
            if [[ -e "$file" ]]; then
                rm -f "$file" \
                    || errmsg $EX_ERROR 2004 "ols_clean: cannot remove temporary file, $file" >&2
            fi
        done <$OLSMKT
    rm -f "$OLSMKT" \
        || errmsg $EX_ERROR 2004 "ols_clean: cannot remove temporary file, $OLSMKT" >&2
    fi

    exit $EX_CODE                # exit with exit code
} # end ols_end

