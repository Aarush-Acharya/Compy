from joblib import load
from flask import Flask, jsonify, request
from flask_restful import Resource, Api
import os
import pickle
import joblib
from joblib import load
import numpy as np
import pandas as pd

app = Flask(__name__)
api = Api(app)


@app.route('/api/v1/', methods=['GET'])
def data_fetch():
    #api request

    field = request.args.get('field').lower()
    print("field is:", field)
    if field == 'data_science':
        data = 0
    elif field == 'ai':
        data = 1
    elif field == 'gaming':
        data = 2
    elif field == 'cyber_security':
        data = 3
    elif field == 'cloud_computing':
        data = 4
    elif field == 'block_chain':
        data = 5
    elif field == 'video_editing':
        data = 6
    elif field == 'iot_robotics':
        data = 7
    elif field == '3d_modeling':
        data = 8
    elif field == 'web_development':
        data = 9
    elif field == 'ui_ux':
        data = 10
    elif field == 'general_cs':
        data = 11
    elif field == 'ar_vr':
        data = 12
    elif field == 'no_specialization':
        data = 13
    elif field == 'basic_coding_and_casual_gaming':
        data = 14
    elif field == 'core':
        data = 15
    elif field == 'devops':
        data = 16
    
    
    # ////////////////////////////////////////////////////////////////
    
    import pandas as pd

    a = pd.read_csv("Computer Preference Analysis (Responses) - Form Responses 1 (1).csv")
    print(a)
    df = a.drop('Timestamp', axis=1)
    df.rename(columns={'Field of interest': 'Field'}, inplace=True)
    df.rename(columns={'Brand of your laptop that you are using for your use case?': 'Brand'}, inplace=True)
    df.rename(columns={'The processor of your laptop that you use for your use case?': 'Processor'}, inplace=True)
    df.rename(columns={'The Graphic Card of your laptop that you use for your use case?': 'GCard'}, inplace=True)
    df.rename(columns={'The RAM of your laptop that you use for your use case?': 'RAM'}, inplace=True)
    df.rename(columns={'The OS of your laptop that you use for your use case?': 'OS'}, inplace=True)
    df.rename(columns={'Scale your priority for tech specs you would go for buying a laptop for your usecase(1 being the lowest and 4 being the highest)\n [Processor ]': 'Prior_Pross'}, inplace=True)
    df.rename(columns={'Scale your priority for tech specs you would go for buying a laptop for your usecase(1 being the lowest and 4 being the highest)\n [Graphic Card]': 'Prior_GC'}, inplace=True)
    df.rename(columns={'Scale your priority for tech specs you would go for buying a laptop for your usecase(1 being the lowest and 4 being the highest)\n [RAM]': 'Prior_RAM'}, inplace=True)
    df.rename(columns={'Scale your priority for tech specs you would go for buying a laptop for your usecase(1 being the lowest and 4 being the highest)\n [OS]': 'Prior_OS'}, inplace=True)
    # print(df)
    df['GCard'] = df['GCard'].replace(to_replace='Integrated', value='Integrated/Shared')
    # print(df)
    df['GCard'] = df['GCard'].replace(to_replace='Discrete', value='Discrete/Dedicated')
    # print(df)
    
    
    
    ####
    
    df_count = pd.value_counts(df[df.columns[0]])


    feilds_df = df_count.to_frame(name=df.columns[0])
    feilds_df
    df1ff = pd.concat([feilds_df], axis=1)
    df1ff
    df1ff.reset_index(level=0, inplace=True)
    df1ff
    df1ff.rename(columns={'index': df.columns[0], df.columns[0]: 'Count'}, inplace=True)
    df1ff
    
    ####
    
    
    
    #####
    
    
    
    #####
    k = data
    print(df1ff[df1ff.columns[0]][k], " ")
    df_Data = df.loc[df['Field'] == df1ff[df1ff.columns[0]][k]]
    ls_1 = []
    ls_2 = []
    count_1 = []
    count_2 = []
    for i in range(2, 6):
        
        processor_count = pd.value_counts(df_Data[df_Data.columns[i]])
        prior_count_1 = pd.value_counts(df_Data[df_Data.columns[i + 4]])
        processor_df = processor_count.to_frame(name=df_Data.columns[i])
        priorProcess_df = prior_count_1.to_frame(name=df_Data.columns[i + 4])
        #RAM_df = RAM_count.to_frame(name='RAM')
        df1p = pd.concat([processor_df], axis=1)
        df1p
        df1_prior_P = pd.concat([priorProcess_df], axis=1)
        df1_prior_P
        df1p.reset_index(level=0, inplace=True)
        df1_prior_P.reset_index(level=0, inplace=True)
        df1p.rename(columns={'index': df_Data.columns[i], df_Data.columns[i]: 'Count'}, inplace=True)
        df1p.Count.max()
        df1_prior_P.rename(columns={'index': df_Data.columns[i + 4], df_Data.columns[i + 4]: 'Count'}, inplace=True)
        df1_prior_P.Count.max()
        df2p = df1p[df1p.Count == df1p.Count.max()]
        df2_prior_P = df1_prior_P[df1_prior_P.Count == df1_prior_P.Count.max()]
        print(df2p)
        print(df2_prior_P)
        len(df2p)
        len(df2_prior_P)
        print("The people with", df1ff[df1ff.columns[0]][k], "usually use ")
        for j in range(0, len(df2p)):
            print(df2p[df2p.columns[0]][j], " ")
            ls_1.append(df2p[df2p.columns[0]][j])
            count_1.append(j)
            print(df2p.columns[0] + " laptops \n\n")
        print("The people with", df1ff[df1ff.columns[0]][k], "gives the priority order ")
        for m in range(0, len(df2_prior_P)):
            print(df2_prior_P[df2_prior_P.columns[0]][m], " ")
            ls_2.append(df2_prior_P[df2_prior_P.columns[0]][m])
            count_2.append(m)
            
            
            print("to " + df2p.columns[0] + "\n\n")
    print(ls_1)
    processor = ls_1[0]
    gpu = ls_1[1]
    ram = ls_1[2]
    os = ls_1[3]
    print(ls_2)
    
    computed_json = {
        "processor": str(processor),
        "gpu": str(gpu),
        "ram": str(ram),
        "os": str(os),
        "priority_processor": int(ls_2[0]),
        "priority_gpu": int(ls_2[1]),
        "priority_ram": int(ls_2[2]),
        "priority_os": int(ls_2[3])}
    
    return jsonify(computed_json)
    

    # return str(data)

    # Api-Request :: http://127.0.0.1:5675/api/v1/?field=data_science
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5675)

