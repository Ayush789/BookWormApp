from bookworm import *
#%matplotlib inline
#import matplotlib.pyplot as plt
#import seaborn as sns
#sns.set_style('whitegrid')
#plt.rcParams['figure.figsize'] = (12,9)

import pandas as pd
import numpy as np
import glob
import networkx as nx
from networkx.readwrite import json_graph
path=r'/home/chirag/new books/*.txt'
files = glob.glob(path)
def get_g(files,g):
    for novel in files:
        print(novel)
        book = load_book(novel)
        characters = extract_character_names(book)
        sequences = get_sentence_sequences(book)

        df = find_connections(sequences, characters)
        cooccurence = calculate_cooccurence(df)
        interaction_df = get_interaction_df(cooccurence, threshold=7)
        
    
        G = nx.from_pandas_edgelist(interaction_df,source='source',target='target')
        
        g[novel[1][6:-4]]=G
    return g
g=get_g(files,g={})
print(g)