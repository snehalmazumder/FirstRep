#!/usr/bin/env python
# coding: utf-8

# In[61]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[62]:


child = pd.read_csv('Age_Height_Data.csv')


# In[63]:


child


# In[25]:


X = child[['Age in Months']]
y = child['height in cm']


# In[64]:


from sklearn.model_selection import train_test_split


# In[65]:


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=101)


# In[66]:


from sklearn.linear_model import LinearRegression


# In[67]:


lm = LinearRegression()


# In[68]:


lm.fit(X_train,y_train)


# In[69]:


predictions = lm.predict(X_test)


# In[70]:


predictions


# In[71]:


X_test


# In[35]:


plt.scatter(X,y)


# In[36]:


plt.scatter(y_test,predictions)


# In[37]:


from sklearn import metrics


# In[38]:


print('MAE:', metrics.mean_absolute_error(y_test, predictions))
print('MSE:', metrics.mean_squared_error(y_test, predictions))
print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions)))


# In[39]:


# print the intercept
print(lm.intercept_)


# In[40]:


coeff_df = pd.DataFrame(lm.coef_,X.columns,columns=['Coefficient'])
coeff_df


# In[58]:


yy=64.19+X*.6673
round(yy,0)


# In[60]:


plt.plot(X,yy)
plt.scatter(X,y)


# In[ ]:




