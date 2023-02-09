from pathlib import Path

from fastapi import FastAPI
from joblib import load

app = FastAPI()

model = load(Path('./models/model.joblib'))
pipe = load(Path('./models/pipe.joblib'))
select = load(Path('./models/select.joblib'))


@app.post('/predict/')
def predict(description: str) -> dict:
    """Predicts whether a given job description is fraudulent(1) or not (0).
    Args:
        description (str): job description.
    Returns:
        dict: {"label": "fraudulent", "prediction": bool}
    """
    description = [description]
    x = pipe.transform(description)
    x = select.transform(x.toarray())
    prediction = model.predict(x)
    return {"label": "fraudulent", "prediction": int(prediction[0])}
