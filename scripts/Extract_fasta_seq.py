#This is to extract fasta sequence from a set of fasta sequence in a file

import sys

filename = sys.argv[1]
seq_number = int(sys.argv[2])


def read_file(filename,seq_number):
    open_file = open(filename,"r").read()
    seq_count = 0
    total_length = 0
    output_seq = ""
    found = False
    EOD = False
    for entry in open_file:
        if entry == ">":
            seq_count += 1
            if seq_count == seq_number:
                output_seq += entry
        if seq_count > seq_number:
            break
        if seq_count == seq_number:
            output_seq += entry
            if entry == "\n":
                EOD = True
            if EOD == True and entry != "\n":
                total_length += 1
            found = True
        
        
        
    if found == False:
        print ("Sequence number exceeded")
    else:
        print (output_seq)
        print (total_length)

read_file(filename,seq_number)
