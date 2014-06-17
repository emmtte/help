#!/usr/bin/perl
#
# Syntax: showdir.pl <directory> <old-directory> <menuname>
#         editdir.pl <directory> <old-directory> <menuname>
#
# If called as showdir, it will display files. If called as editdir, 
# it edits files.
#
# Where <directory> is the directory to display, and <old-directory>
# is the optional name of the directory they were on previously.
# Doen't specify <old-directory> yourself, it is only used internally by the
# program.
#
# Generates a pdmenurc file at stdout that lets the user view files in the 
# directory (or edit them if the program is run as "editdir.pl"), and change
# to other directories. The file will define a menu named 
# "show_directory_<directory>", unless the <menuname> option is passed, 
# in which case the menu will be named <namename>

if ($0=~m/editdir/ ne undef) {
	$mode='edit';
	$editor=$ENV{EDITOR} || $ENV{VISUAL} || 'pico';
}
else {
	$mode='show';
}

$dir=shift;
$dir.='/' if $dir=~m#/$# eq undef; # make sure there is a trailing / on $dir.
$olddir=shift;
$olddir.='/' if $olddir=~m#/$# eq undef; # make sure there is a trailing / on $olddir.
$menuname=shift;
$menuname="show_directory_$dir" if !$menuname;

print "menu:$menuname:Files in $dir:";
print "Select a file to $mode it or select a directory to move into it.\n";

opendir(PWD,$dir);
@dirlist=readdir(PWD);
foreach $fn (sort(@dirlist)) {
	# Make a version of $fn that has ':' and '\' and '_' characters
	# escaped out.
	$fne=$fn;
	$fne=~s/\\/\\\\/g;
	$fne=~s/:/\\:/g;
	$fne=~s/_/\\_/g;

	if (-d "$dir/$fn" && $fn ne '.' && $fn ne '..') {
		# See if the directory the selected is the directory we were just on 
		# previously.
		if ("$dir$fn/" ne $olddir) {
			print "group:$fne/\n";
			print "exec::makemenu:$0 $dir$fne/ $dir\n";
			print "show:::show_directory_$dir$fne/\n";
			print "remove:::show_directory_$dir$fne/\n";
			print "endgroup\n";
		}
		else {
			print "exit:$fne/\n";
		}
	}
	elsif ($fn eq '..' && $dir ne '/') {
		# Go down one directory.
		($parent)=$dir=~m:^(.*)/.*?/:;
		$parent.='/';
		# If they select to go down one directory, and the result is the directory
		# we were just on previously, then exit the menu instead of displaying
		# a new one.
		if ($parent ne $olddir) {
			print "group:$fne/\n";
			print "exec::makemenu:$0 $parent $dir\n";
			print "show:::show_directory_$parent\n";
			print "remove:::show_directory_$parent\n";
			print "endgroup\n";
		}
		else {
			print "exit:$fne/\n";
		}
	}
	elsif ($fn ne '.' && $fn ne '..') {
		if ($mode eq 'show') {
			print "exec:$fne:display:cat $dir$fn 2>/dev/null\n";
		}
		else {
			print "exec:$fne:pause:$editor $dir$fn\n";
		}
	}
}
closedir(PWD);
