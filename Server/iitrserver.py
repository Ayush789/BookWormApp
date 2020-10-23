
id_list = [1342, 84, 98, 219, 1080, 2542, 844, 11, 2701, 1661, 76, 16328, 43, 25344, 5200, 2554, 6130, 1952, 74, 345, 160, 408, 1400, 1260, 2591, 174, 58834, 2600, 46, 1322, 30254, 4300, 58836, 20228, 205, 2814, 158, 768, 3207, 23, 1184, 851, 16, 1232, 1497, 58838, 135, 120, 28054, 19942]

from flask import Flask,request,jsonify
import json

app = Flask(__name__)
matrix = {}
with open('matrix.json','r') as f:
    matrix = json.load(f)

#print(matrix)
@app.route('/')
def ping():
    return "Hi"

@app.route('/getRecommendation')
def getRecommendation():
    mode = request.args.get('mode')
    book_ids = request.args.getlist('id')
    ans = {}
    for i in id_list:
        ans[str(i)]=0
    print(ans)
    #print(matrix[1342])
    for book in book_ids:
        book = str(book)
        for i in matrix[book]:
            ans[i]+=int(matrix[book][str(i)])
    print(ans)
    a = []
    if mode=="1":
        print("1")
        for i in sorted(ans.items(), key=lambda x: x[1])[-5:]:
            a.append(i[0])
    else:
        print("2")
        for i in sorted(ans.items(), key=lambda x: x[1])[:5]:
            a.append(i[0])
    print(a)
    print(mode)
    return jsonify({"ids":a})