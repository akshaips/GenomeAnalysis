import sys

filename1 = sys.argv[1] #my gene against article blastp
filename2 = sys.argv[2] #article gene against my gene blastp
filename3 = sys.argv[3] #my gene prokka annotation
filename4 = sys.argv[4] #article gene prokka annotation
filename5 = sys.argv[5] #egg nog annotation

def read_file(filename,inverse=False):
    open_file = open(filename,"r").readlines()
    
    output_dict = {}
        
    for entry in open_file:
        entry_split = entry.split()
        
        if inverse:
            if entry_split[1] not in output_dict:
                output_dict[entry_split[1]] = list()
            output_dict[entry_split[1]].append(entry_split[0])
        else:
            if entry_split[0] not in output_dict:
                output_dict[entry_split[0]] = list()
            output_dict[entry_split[0]].append(entry_split[1])
        
    return (output_dict)

dict1 = read_file(filename1)
dict2 = read_file(filename2,True)
bidirectional_dict = {}
for entry in dict2:
    #bidirectional_dict[entry] = list()
    for pairs in dict2[entry]:
        try:
            if pairs in dict1[entry]:
                bidirectional_dict[entry] = pairs
                #bidirectional_dict[entry].append(pairs)
        except:
            None

single_dict = {}
for entry in dict1:
    if entry not in bidirectional_dict:
        single_dict[entry] = dict1[entry][0]
        
def find_function(gene_id,fileopen):
    for line in fileopen:
        if gene_id in line:
            return str(line[1+len(gene_id):-1])

def find_function_eggnog(gene_id,fileopen):
    for line in fileopen:
        if gene_id in line:
            #print (1)
            #print (line.split("\t")[-1])
            if line.split("\t")[-1] != "":
                return str(line.split("\t")[-1][:-1])
            else:
                return (" Not found ")
    return (" Not found ")


open_file3 = open(filename3,"r").readlines()
open_file4 = open(filename4,"r").readlines()
open_file5 = open(filename5,"r").readlines()

output = open("output.txt","w")
output.write("my_gene,prokka,article_gene,prokka,eggnog annotation\n")
output.write("#bidirectional hits\n")
for entry in bidirectional_dict:
    output.write(entry + "," + find_function(entry,open_file3) + ",")
    output.write(bidirectional_dict[entry] + "," + find_function(bidirectional_dict[entry],open_file4) + ",")
    output.write(find_function_eggnog(entry,open_file5))
    output.write("\n")

output.write("#single way hits\n")
for entry in single_dict:
    output.write(entry + "," + find_function(entry,open_file3) + ",")
    output.write(single_dict[entry] + "," + find_function(single_dict[entry],open_file4) + ",")
    output.write(find_function_eggnog(entry,open_file5))
    output.write("\n")
    
output.write("#no hits\n")
for entry in open_file3:
    if entry[0] == ">":
        if entry[1:1+len("CBNIABCL_00001")] not in bidirectional_dict and entry[1:1+len("CBNIABCL_00001")] not in single_dict:
            print (entry[1:1+len("CBNIABCL_00001")])
            output.write(entry[1:1+len("CBNIABCL_00001")] + "," + entry[1+len("CBNIABCL_00001"):-1] + ",")
            output.write("\n")
    
'''qseqid sseqid pident length qlen slen mismatch gapopen qstart qend sstart send evalue bitscore '''
