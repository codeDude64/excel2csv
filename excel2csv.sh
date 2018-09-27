#!/bin/bash

#    excel2csv. Convert xls and xlsx files to csv 
#    Copyright (C) 2018  Salvador Hernández López
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Author - Salvador Hernández López
# Email - chavatloz@gmail.com

# if the var COMPARATION finish with .xls return the name
#if not return ""

if [ $# = 1 ];
then
    echo "OK"
    
        if [ "`echo $1 | grep '.xls\>'`" == "" ];
        then
            echo "this is not a xls file"
            if [ "`echo $1 | grep '.xlsx\>'`" == "" ];
            then
                echo "this is not a xlsx file"
            else
                echo "this is a xlsx file"
            fi
        
        else
            echo "this is a xls file"
            # xls logic
        fi
else
    echo "You need just one parameter"
    exit
fi


#COMPARATION=`echo $1 | grep '.xls'`

#echo $COMPARATION