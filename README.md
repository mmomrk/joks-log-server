# joks-log-plotter

A simple http local server to display logs taken from the remote FTP server

## Useage

./refresher.sh

## Description

* Launches simpleHTTPServer -based simple HTTP server in the local network

* Takes file list from the remote FTP server with (logs) (Warning: address is hardcoded)

* Takes the last file from the list of files (Warning: may break if the answer is different from expected)

* Downloads the fresh file

* Trims it to contain header and column titles (Warning: may break if line count is greater than row count [which can be specified though])

* Replaces decimal commas to dots

* Generates image with gnuplot that is visible on the webpage (Warning: at the moment there is only one test image on the page and the column number is hardcoded)

* Repeates after delay


## Options

* -h|-?		shows help (not implemented yet)

*-d sec		delay between server last command executed and the next FTP server poll. (This is smaller than refresh period by calculations time. But it guarantees that the machine would have this amount of seconds rest from this task)

*-l integer	number of lines to be represented. Since plotting whole log file may be uninformative

## What to do with this

Since this thing has hardcoded FTP address and expects certain file log format then expecting any sane results from launching it on a random machine would be overoptimistic.

But you may check how to deal with python's SimpleHTTPServer IRL and how to deal with plotting time-stamped files with Gnuplot and there is a example of sed replacements.

## Requirements

* bash (or more generally, sh)

* python (tested with python2.7.12)

* gnuplot (capable of png handling)

* FTP server in the local network that does 

## Testing

* You may try to toy with this thing by adding a logging machine with FTP server in the local network. Don't forget to adjust IP and column number and time format in the log and check that it's the last file being retrieved and check that the filename is cut properly. 

* If you intend to use Windows machine as FTP server then one simple app is ftpdmin. It is not finished and abandoned but is free and does the job if security is not the case


## Licence 

Although might look as an overkill let's be specific:

All executables are spread under MIT licence.

Copyright (c) 2018 Mark Bochkov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
