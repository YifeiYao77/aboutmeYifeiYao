import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


%matplotlib inline
s = pd.Series(np.random.normal(size=10))
s.plot()
