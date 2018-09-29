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


function XLSX_LOGIC () {
    local DOC_NAME=$1
    local DIR_NAME=${DOC_NAME%".xlsx"}
    mkdir $DIR_NAME
    local SHEET=`xlsx2csv -s 0 $1`
    #echo "$SHEET"
    #local REGEX="\-+ [0-9]+ - ([^\n]+)([.]+)"
    #local REGEX="\-+ [0-9]+ - ([A-Za-z0-9]+).([^\-]+)"
    local REGEX="\-{8} [0-9]+ - ([A-Za-z0-9]+).([^\-]+)(.+)"
    local NULL

    while [[ $SHEET =~ $REGEX ]]
    do
        #echo "${BASH_REMATCH[1]}" #Sheet name
        #echo "${BASH_REMATCH[2]}" #Sheet text
        echo "${BASH_REMATCH[1]}".csv #Sheet name
        echo "${BASH_REMATCH[2]}" > $DIR_NAME/"${BASH_REMATCH[1]}".csv #Sheet text
        SHEET=${BASH_REMATCH[3]}
        
    done
    

    

    # xlsx2csv -s 0 GG.xlsx | grep  "\-\-\-\-\-\-\-\-.[0-9]"   Lista los numeros de las hojas
    #xlsx2csv -s 0 GG.xlsx | grep  "\-\-\-\-\-\-\-\-.[0-9].-."  Lista los ------------ 1 -

    #sheet=$1 regex=$2 group=$3  if [[ $sheet =~ $regex ]] then   echo ${BASH_REMATCH[$group]}; fi
}


function XLS_LOGIC () {
    echo $1
    libreoffice --headless --convert-to xlsx $1
    XLSX_LOGIC $1"x"


}



if [ $# = 1 ];
then
    echo "OK"
    
        if [ "`echo $1 | grep '.xls\>'`" == "" ];
        then
            echo ""
            if [ "`echo $1 | grep '.xlsx\>'`" == "" ];
            then
                echo ""
            else
                echo ""
                XLSX_LOGIC $1
            fi
        
        else
            echo ""
            # xls logic
            XLS_LOGIC $1
        fi
else
    echo "You need just one parameter"
    exit
fi





#COMPARATION=`echo $1 | grep '.xls'`

#echo $COMPARATION