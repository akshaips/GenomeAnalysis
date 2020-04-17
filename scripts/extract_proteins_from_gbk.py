import sys

filename = sys.argv[1] #input gbk file (prokka output)


def read_file(filename):
    file_open = open(filename,"r").read()
    
    output_dict = {}
    
    locus_found = False
    locus_start = False
    trans_found = False
    trans_start = False
    product_found = False
    product_start = False
    locus_tag = ""
    trans_tag = ""
    product_tag = ""
    CDS_checkpoint = False
    for n,entry in enumerate(file_open):
        if file_open[n:n+len(" CDS ")] == " CDS ":
            CDS_checkpoint = True
        elif file_open[n:n+len(" gene ")] == " gene ":
            CDS_checkpoint = False
        else:
            None
        
        if CDS_checkpoint:
            if file_open[n:n+len("/locus_tag")] == "/locus_tag":
                locus_found = True
            if locus_found and locus_start:
                if entry == '"':
                    locus_found = False
                    locus_start = False
                if entry != "\n" and entry != " " and entry != '"':
                    locus_tag += entry
            if locus_found:
                if entry == '"':
                    locus_start = True
                        
            if file_open[n:n+len("/product")] == "/product":
                product_found = True
            if product_found and product_start:
                if entry == '"':
                    product_found = False
                    product_start = False
                if entry != "\n" and entry != '"':
                    product_tag += entry
            if product_found:
                if entry == '"':
                    product_start = True
                        
            if file_open[n:n+len("/translation")] == "/translation":
                trans_found = True
            if trans_found and trans_start:
                if entry == '"':
                    trans_found = False
                    trans_start = False
                    output_dict[locus_tag + " " + product_tag] = trans_tag
                    CDS_checkpoint = False
                    locus_tag = ""
                    product_tag = ""
                    trans_tag = ""
                if entry != "\n" and entry != " " and entry != '"':
                    trans_tag += entry
            if trans_found:
                if entry == '"':
                    trans_start = True
                
    write_output(output_dict)
    
def write_output(output_dict):
    open_output = open(filename[:-4] + "_output.fasta","w")
    for entry in output_dict:
        open_output.write(">" + entry + "\n" + output_dict[entry] + "\n\n")
        
read_file(filename)
