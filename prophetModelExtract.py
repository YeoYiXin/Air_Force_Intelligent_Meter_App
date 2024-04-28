import pandas as pd
from prophet.serialize import model_from_json
import matplotlib.pyplot as plt

#Getting models from json
with open('meterComplaint.json', 'r') as fin:
    MC_model = model_from_json(fin.read())

with open('meterLeak.json', 'r') as fin:
    ML_model = model_from_json(fin.read())

with open('faultyProgram.json', 'r') as fin:
    FP_model = model_from_json(fin.read())

#Months to predict for
future_dates = pd.date_range(start='2025-06-01', end='2028-02-01', freq='MS')
future_df = pd.DataFrame({'ds': future_dates})

#Predict the future demand for each problem
MC_forecast = MC_model.predict(future_df)
ML_forecast = ML_model.predict(future_df)
FP_forecast = FP_model.predict(future_df)

#list of months
dates = MC_forecast['ds']

#total meters needed
totalPrediction = MC_forecast['yhat']+ML_forecast['yhat']+FP_forecast['yhat']
print(totalPrediction)