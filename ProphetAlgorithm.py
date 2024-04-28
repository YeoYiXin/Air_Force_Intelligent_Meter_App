import pandas as pd
from prophet.serialize import model_from_json
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/get_forecast", methods=["GET", "POST"]) 

def forecast():
    if request.method == "POST":
        dateStart = request.form.get('dateStart')
        dateEnd = request.form.get('dateEnd')
        #dateEnd = request.files.get('dateEnd')
        if dateStart is None or dateStart == "":
            return jsonify({"error": "no dateStart provided"})
        if dateEnd is None or dateEnd == "":
            return jsonify({"error": "no dateEnd provided"})
        
        try:
            with open('meterComplaint.json', 'r') as fin:
                MC_model = model_from_json(fin.read())

            with open('meterLeak.json', 'r') as fin:
                ML_model = model_from_json(fin.read())

            with open('faultyProgram.json', 'r') as fin:
                FP_model = model_from_json(fin.read())
                
            #Months to predict for
            future_dates = pd.date_range(start=dateStart, end=dateEnd, freq='MS')
            future_df = pd.DataFrame({'ds': future_dates})

            #Predict the future demand for each problem
            MC_forecast = MC_model.predict(future_df)
            ML_forecast = ML_model.predict(future_df)
            FP_forecast = FP_model.predict(future_df)

            dates = MC_forecast['ds']

            #total meters needed
            totalPrediction = round(MC_forecast['yhat']+ML_forecast['yhat']+FP_forecast['yhat'])
            data = {}

            for i in range(len(dates)):
                date_str = dates[i].strftime('%Y-%m-%d')
                data[date_str] = totalPrediction[i]
            
            print("ForecastData in Prophet Algorithm: ", data)

            return jsonify(data)
        except Exception as e:
            return jsonify({"error": str(e)})

    return "OK"

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')